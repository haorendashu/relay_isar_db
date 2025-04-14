import 'dart:convert';

import 'package:isar/isar.dart';

part 'isar_event.g.dart';

@collection
@Name("Event")
class IsarEvent {
  // IsarEvent({
  //   this.id,
  //   required this.pubkey,
  //   required this.createdAt,
  //   required this.kind,
  //   this.tagsStr,
  //   this.tagIndex,
  //   this.content,
  //   this.sig,
  //   this.sources,
  // });

  static IsarEvent loadFromMap(Map<String, dynamic> eventMap) {
    String? tagsStr;
    List<String>? tagIndexList;
    var tags = eventMap["tags"];
    if (tags != null && tags is List) {
      tagsStr = jsonEncode(tags);

      // 生成 tagIndex
      tagIndexList =
          tags
              .map((tag) {
                if (tag is List && tag.length >= 2) {
                  return "${tag[0]}_${tag[1]}";
                }
                return "";
              })
              .where((element) => element.isNotEmpty)
              .toList();
      print("tagIndexList $tagIndexList");
    }

    final event =
        IsarEvent()
          ..id = eventMap['id'] as String?
          ..pubkey = eventMap['pubkey'] as String?
          ..createdAt = eventMap['created_at'] as int?
          ..kind = eventMap['kind'] as int?
          ..tagsStr = tagsStr
          ..content = eventMap['content'] as String?
          ..sig = eventMap['sig'] as String?
          ..sources = (eventMap['relay'] as List?)?.cast<String>();

    event.tagIndex = tagIndexList;

    return event;
  }

  /// The event ID is a 32-byte SHA256 hash of the serialised event data.
  String? id = '';

  /// The event author's public key.
  String? pubkey;

  /// Event creation timestamp in Unix time.
  int? createdAt;

  @Index(composite: [CompositeIndex('pubkey'), CompositeIndex('createdAt')])
  // @Index(
  //   composite: [
  //     CompositeIndex('tagIndex', type: IndexType.hashElements),
  //     CompositeIndex('createdAt'),
  //   ],
  // )
  /// Event kind identifier (e.g. text_note, set_metadata, etc).
  int? kind;

  /// A JSON array of event tags.
  String? tagsStr;

  /// Tags for indexing, not stored
  /// A list to index tags. value: "${tags[0]}_${tags[1]}"
  @Ignore()
  List<String>? _tagIndex;

  set tagIndex(List<String>? value) {
    _tagIndex = value;
  }

  @Index(type: IndexType.value)
  // @Index(
  //   type: IndexType.hashElements,
  //   composite: [CompositeIndex('kind'), CompositeIndex('createdAt')],
  // )
  List<String>? get tagIndex {
    return _tagIndex;
  }

  /// Event content.
  String? content;

  /// 64-byte Schnorr signature of [Event.id].
  String? sig = '';

  /// Relay that an event was received from.
  List<String>? sources;

  Id get isarId => fastHash(id!);

  /// 针对 Dart 字符串优化的 64 位哈希算法 FNV-1a
  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
