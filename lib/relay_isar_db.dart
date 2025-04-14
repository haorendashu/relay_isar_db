import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:nostr_sdk/relay_local/relay_db_extral.dart';
import 'package:nostr_sdk/utils/db_util.dart';
import 'package:nostr_sdk/utils/string_util.dart';
import 'package:relay_isar_db/isar_event.dart';

class RelayIsarDb extends RelayDBExtral {
  static const _dbName = "iasr_db";

  Isar isar;

  RelayIsarDb._(this.isar);

  static Future<RelayIsarDb?> init() async {
    var path = await getFilepath();
    print("path $path");

    final isar = await Isar.open([IsarEventSchema], directory: path);

    return RelayIsarDb._(isar);
  }

  static Future<String> getFilepath() async {
    return await DBUtil.getPath(_dbName);
  }

  @override
  Future<int> addEvent(Map<String, dynamic> event) async {
    var e = IsarEvent.loadFromMap(event);
    isar.isarEvents.put(e);
    return 1;
  }

  @override
  Future<int?> allDataCount() async {
    return await isar.isarEvents.count();
  }

  @override
  Future<void> deleteData({String? pubkey}) async {
    if (StringUtil.isNotBlank(pubkey)) {
      await isar.isarEvents.filter().pubkeyEqualTo(pubkey!).deleteAll();
    } else {
      await isar.isarEvents.clear();
    }
  }

  @override
  Future<void> deleteEvent(String pubkey, String id) async {
    await isar.isarEvents.delete(IsarEvent.fastHash(id));
  }

  @override
  Future<void> deleteEventByKind(String pubkey, int eventKind) async {
    await isar.isarEvents
        .filter()
        .kindEqualTo(eventKind)
        .pubkeyEqualTo(pubkey)
        .deleteAll();
  }

  @override
  Future<int?> doQueryCount(Map<String, dynamic> filter) async {
    var query = isar.isarEvents.where();
    handleQueryFilter(query, filter, true);
    return await query.count();
  }

  @override
  Future<List<Map<String, Object?>>> doQueryEvent(
    Map<String, dynamic> filter,
  ) async {
    var query = isar.isarEvents.where();
    handleQueryFilter(query, filter, false);

    final events = await query.findAll();
    return handleQueryResult(events);
  }

  void handleQueryFilter(
    QueryBuilder<IsarEvent, IsarEvent, QWhere> qWhereBuilder,
    Map<String, dynamic> filter,
    bool doCount,
  ) {
    filter = Map<String, dynamic>.from(filter);

    var key = "limit";
    var limit = filter[key];
    filter.remove(key);
    if (doCount) {
      // doCount, don't need to limit
    } else {
      // un doCount, must limit and sort by desc
      qWhereBuilder.sortByCreatedAtDesc();

      if (limit != null && limit > 0) {
        qWhereBuilder.limit(limit as int);
      } else {
        qWhereBuilder.limit(100); // This is a default num.
      }
    }

    var queryBuilder = qWhereBuilder.filter();

    key = "ids";
    if (filter[key] != null && filter[key] is List && filter[key].isNotEmpty) {
      final ids = filter['ids'] as List;
      if (ids.isNotEmpty) {
        queryBuilder.group((q) {
          return q.anyOf(ids, (q, id) => q.idEqualTo(id as String));
        });
      }

      filter.remove(key);
    }

    key = "authors";
    if (filter[key] != null && filter[key] is List && filter[key]!.isNotEmpty) {
      final authors = filter['authors'] as List;
      if (authors.isNotEmpty) {
        queryBuilder.group((q) {
          return q.anyOf(
            authors,
            (q, author) => q.pubkeyEqualTo(author as String),
          );
        });
      }

      filter.remove(key);
    }

    key = "kinds";
    if (filter[key] != null && filter[key] is List && filter[key]!.isNotEmpty) {
      final kinds = filter['kinds'] as List;
      if (kinds.isNotEmpty) {
        queryBuilder.group((q) {
          return q.anyOf(kinds, (q, kind) => q.kindEqualTo(kind as int));
        });
      }

      filter.remove(key);
    }

    var since = filter.remove("since");
    if (since != null) {
      queryBuilder.createdAtGreaterThan(filter['since'] as int);
    }

    var until = filter.remove("until");
    if (until != null) {
      queryBuilder.createdAtLessThan(filter['until'] as int);
    }

    var search = filter.remove("search");
    if (search != null && search is String) {
      queryBuilder.contentContains(search);
    }

    for (var entry in filter.entries) {
      var k = entry.key;
      var vs = entry.value;

      List<String> tagIndexValues = [];
      if (k != "limit") {
        for (var vItem in vs) {
          k = k.replaceFirst("#", "");
          var tagIndexValue = k + '_' + vItem;
          tagIndexValues.add(tagIndexValue);
        }

        if (tagIndexValues.isNotEmpty) {
          queryBuilder.group((q) {
            return q.anyOf(
              tagIndexValues,
              (q, v) => q.tagIndexElementEqualTo(v),
            );
          });
        }
      }
    }
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
    var queryBuilder = isar.isarEvents
        .where(sort: Sort.desc)
        .filter()
        .pubkeyEqualTo(pubkey);
    if (eventKinds != null && eventKinds.isNotEmpty) {
      queryBuilder = queryBuilder.group((q) {
        return q.anyOf(eventKinds, (q, kind) => q.kindEqualTo(kind));
      });
    }

    final events = await queryBuilder.findAll();
    return handleQueryResult(events);
  }

  List<Map<String, Object?>> handleQueryResult(List<IsarEvent> events) {
    return events
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
  }
}
