import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:nostr_sdk/relay_local/relay_db_extral.dart';
import 'package:nostr_sdk/utils/db_util.dart';
import 'package:nostr_sdk/utils/later_function.dart';
import 'package:nostr_sdk/utils/string_util.dart';
import 'package:relay_isar_db/isar_event.dart';

class RelayIsarDB extends RelayDBExtral with LaterFunction {
  static const _dbName = "iasr_db";

  Isar isar;

  RelayIsarDB._(this.isar, super.appName);

  static Future<RelayIsarDB?> init(String appName,
      {int maxSizeMiB = Isar.defaultMaxSizeMiB * 100}) async {
    var path = await getFilepath(appName);
    print("path $path");

    Directory dir = Directory(path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    final isar = await Isar.open(
      [IsarEventSchema],
      directory: path,
      maxSizeMiB: maxSizeMiB, // set max size 100GB
    );

    return RelayIsarDB._(isar, appName);
  }

  static Future<String> getFilepath(String appName) async {
    return await DBUtil.getPath(appName, _dbName);
  }

  // a eventId map in mem, to avoid alway insert event.
  Map<String, int> _memEventIdMap = {};

  bool checkAndSetEventFromMem(Map<String, dynamic> event) {
    var id = event["id"];
    var value = _memEventIdMap[id];
    _memEventIdMap[id] = 1;
    return value != null;
  }

  List<IsarEvent> penddingEventMspList = [];

  @override
  Future<int> addEvent(Map<String, dynamic> event) async {
    var sources = event["sources"];
    if (checkAndSetEventFromMem(event) &&
        (sources == null || (sources is List && sources.isEmpty))) {
      // event had added and source is null or empty, skip.
      return 0;
    }

    var e = IsarEvent.loadFromMap(event);
    penddingEventMspList.add(e);
    later(_batchAddEvents);

    return 0;
  }

  Future<void> _batchAddEvents() async {
    if (penddingEventMspList.isEmpty) {
      return;
    }

    // clone list to avoid modify the list in batch add events.
    var currentList = [...penddingEventMspList];
    // clear pendding list
    penddingEventMspList.clear();

    List<int> eventIds = [];
    Map<int, IsarEvent> eventMap = {};
    for (var event in currentList) {
      eventIds.add(event.isarId);
      eventMap[event.isarId] = event;
    }

    List<IsarEvent> needPutEvents = [];
    var events = await isar.isarEvents.getAll(eventIds);
    for (var oldEvent in events) {
      if (oldEvent == null) {
        continue;
      }

      var newEvent = eventMap.remove(oldEvent.isarId);
      if (newEvent != null) {
        // newEvent and oldEvent both exist!
        // check the sources.
        if (newEvent.sources == null || newEvent.sources!.isEmpty) {
          continue;
        }

        var newSource = newEvent.sources!.first;
        if (oldEvent.sources == null || oldEvent.sources!.isEmpty) {
          oldEvent.sources = [newSource];
          needPutEvents.add(oldEvent);
        } else {
          if (!(oldEvent.sources!.contains(newSource))) {
            oldEvent.sources = [...oldEvent.sources!, newSource];
            needPutEvents.add(oldEvent);
          }
        }
      }
    }
    // these events need to add
    if (eventMap.isNotEmpty) {
      needPutEvents.addAll(eventMap.values);
    }

    // batch add events
    if (needPutEvents.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.isarEvents.putAll(needPutEvents);
      });
    }
  }

  @override
  Future<int?> allDataCount() async {
    return await isar.isarEvents.count();
  }

  @override
  Future<void> deleteData({String? pubkey}) async {
    await isar.writeTxn(() async {
      if (StringUtil.isNotBlank(pubkey)) {
        await isar.isarEvents.filter().pubkeyEqualTo(pubkey!).deleteAll();
      } else {
        await isar.isarEvents.clear();
      }
    });
  }

  @override
  Future<void> deleteEvent(String pubkey, String id) async {
    await isar.writeTxn(() async {
      await isar.isarEvents.delete(IsarEvent.fastHash(id));
    });
  }

  @override
  Future<void> deleteEventByKind(String pubkey, int eventKind) async {
    await isar.writeTxn(() async {
      await isar.isarEvents
          .filter()
          .kindEqualTo(eventKind)
          .pubkeyEqualTo(pubkey)
          .deleteAll();
    });
  }

  @override
  Future<int?> doQueryCount(Map<String, dynamic> filter) async {
    filter = Map<String, dynamic>.from(filter);
    var qbi = QueryBuilderInternal<IsarEvent>(collection: isar.isarEvents);
    qbi = handleQueryFilter(filter, qbi);
    return await qbi.build<IsarEvent>().count();
  }

  @override
  Future<List<Map<String, Object?>>> doQueryEvent(
    Map<String, dynamic> filter,
  ) async {
    var filter2 = Map<String, dynamic>.from(filter);
    var limit = filter2.remove("limit");
    limit ??= 100;

    var qbi = QueryBuilderInternal<IsarEvent>(
      collection: isar.isarEvents,
      limit: limit,
    );
    qbi = qbi.addSortBy(r'createdAt', Sort.desc);

    qbi = handleQueryFilter(filter2, qbi);

    final events = await qbi.build<IsarEvent>().findAll();
    // log(jsonEncode(filter));
    // log("events count ${events.length}");
    return handleQueryResult(events);
  }

  FilterGroup _genInQuery(List<dynamic> values, String property) {
    List<FilterOperation> filterList = [];

    for (var value in values) {
      filterList.add(FilterCondition.equalTo(property: property, value: value));
    }

    return FilterGroup(type: FilterGroupType.or, filters: filterList);
  }

  QueryBuilderInternal<IsarEvent> handleQueryFilter(
    Map<String, dynamic> filter,
    QueryBuilderInternal<IsarEvent> queryBuilderInternal,
  ) {
    // var queryBuilder = isar.isarEvents.filter();
    // queryBuilderInternal.addSortBy(r'createdAt', Sort.desc);

    var key = "ids";
    if (filter[key] != null && filter[key] is List && filter[key].isNotEmpty) {
      final ids = filter['ids'] as List;

      if (ids.isNotEmpty) {
        var filterGroup = _genInQuery(ids, r'id');
        queryBuilderInternal = queryBuilderInternal.addFilterCondition(
          filterGroup,
        );
      }

      filter.remove(key);
    }

    key = "authors";
    if (filter[key] != null && filter[key] is List && filter[key]!.isNotEmpty) {
      final authors = filter['authors'] as List;
      if (authors.isNotEmpty) {
        var filterGroup = _genInQuery(authors, r'pubkey');
        queryBuilderInternal = queryBuilderInternal.addFilterCondition(
          filterGroup,
        );
        // queryBuilder = queryBuilder.group((q) {
        //   return q.anyOf(
        //     authors,
        //     (q, author) => q.pubkeyEqualTo(author as String),
        //   );
        // });
      }

      filter.remove(key);
    }

    key = "kinds";
    if (filter[key] != null && filter[key] is List && filter[key]!.isNotEmpty) {
      final kinds = filter['kinds'] as List;
      if (kinds.isNotEmpty) {
        var filterGroup = _genInQuery(kinds, r'kind');
        queryBuilderInternal = queryBuilderInternal.addFilterCondition(
          filterGroup,
        );
        // queryBuilder = queryBuilder.group((q) {
        //   return q.anyOf(kinds, (q, kind) => q.kindEqualTo(kind as int));
        // });
      }

      filter.remove(key);
    }

    var since = filter.remove("since");
    if (since != null) {
      // queryBuilder = queryBuilder.createdAtGreaterThan(since as int);
      queryBuilderInternal = queryBuilderInternal.addFilterCondition(
        FilterCondition.greaterThan(property: r'createdAt', value: since),
      );
    }

    var until = filter.remove("until");
    if (until != null) {
      // queryBuilder = queryBuilder.createdAtLessThan(until as int);
      queryBuilderInternal = queryBuilderInternal.addFilterCondition(
        FilterCondition.lessThan(property: r'createdAt', value: until),
      );
    }

    var search = filter.remove("search");
    if (search != null && search is String) {
      // queryBuilder = queryBuilder.contentContains(search);
      queryBuilderInternal = queryBuilderInternal.addFilterCondition(
        FilterCondition.matches(property: r'content', wildcard: search),
      );
    }

    for (var entry in filter.entries) {
      var k = entry.key;
      var vs = entry.value;

      List<String> tagIndexValues = [];
      if (k != "limit" && vs is List) {
        for (var vItem in vs) {
          k = k.replaceFirst("#", "");
          var tagIndexValue = k + '_' + vItem;
          tagIndexValues.add(tagIndexValue);
        }

        if (tagIndexValues.isNotEmpty) {
          var filterGroup = _genInQuery(tagIndexValues, r'tagIndex');
          queryBuilderInternal = queryBuilderInternal.addFilterCondition(
            filterGroup,
          );
          // queryBuilder = queryBuilder.group((q) {
          //   return q.anyOf(
          //     tagIndexValues,
          //     (q, v) => q.tagIndexElementEqualTo(v),
          //   );
          // });
        }
      }
    }

    return queryBuilderInternal;
  }

  @override
  Future<int> getDBFileSize() async {
    return await isar.isarEvents.getSize(
      includeIndexes: true,
      includeLinks: true,
    );
  }

  @override
  Future<List<Map<String, Object?>>> queryEventByPubkey(
    String pubkey, {
    List<int>? eventKinds,
  }) async {
    var queryBuilder =
        isar.isarEvents.where(sort: Sort.desc).filter().pubkeyEqualTo(pubkey);
    if (eventKinds != null && eventKinds.isNotEmpty) {
      queryBuilder = queryBuilder.group((q) {
        return q.anyOf(eventKinds, (q, kind) => q.kindEqualTo(kind));
      });
    }

    final events = await queryBuilder.findAll();
    return handleQueryResult(events);
  }

  List<Map<String, Object?>> handleQueryResult(List<IsarEvent> events) {
    var list = events
        .map(
          (event) => {
            'id': event.id,
            'pubkey': event.pubkey,
            'created_at': event.createdAt,
            'kind': event.kind,
            'content': event.content,
            'tags': event.tagsStr != null ? jsonDecode(event.tagsStr!) : [],
            'sig': event.sig,
            'sources': event.sources,
          },
        )
        .toList();
    return list;
  }
}
