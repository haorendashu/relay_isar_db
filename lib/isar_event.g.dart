// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarEventCollection on Isar {
  IsarCollection<IsarEvent> get isarEvents => this.collection();
}

const IsarEventSchema = CollectionSchema(
  name: r'Event',
  id: 2102939193127251002,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'kind': PropertySchema(
      id: 3,
      name: r'kind',
      type: IsarType.long,
    ),
    r'pubkey': PropertySchema(
      id: 4,
      name: r'pubkey',
      type: IsarType.string,
    ),
    r'sig': PropertySchema(
      id: 5,
      name: r'sig',
      type: IsarType.string,
    ),
    r'sources': PropertySchema(
      id: 6,
      name: r'sources',
      type: IsarType.stringList,
    ),
    r'tagIndex': PropertySchema(
      id: 7,
      name: r'tagIndex',
      type: IsarType.stringList,
    ),
    r'tagsStr': PropertySchema(
      id: 8,
      name: r'tagsStr',
      type: IsarType.string,
    )
  },
  estimateSize: _isarEventEstimateSize,
  serialize: _isarEventSerialize,
  deserialize: _isarEventDeserialize,
  deserializeProp: _isarEventDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'kind_pubkey_createdAt': IndexSchema(
      id: -5880150996195202789,
      name: r'kind_pubkey_createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'kind',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'pubkey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'tagIndex': IndexSchema(
      id: -956695126862768591,
      name: r'tagIndex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tagIndex',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarEventGetId,
  getLinks: _isarEventGetLinks,
  attach: _isarEventAttach,
  version: '3.3.0',
);

int _isarEventEstimateSize(
  IsarEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pubkey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sig;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.sources;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.tagIndex;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.tagsStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarEventSerialize(
  IsarEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeLong(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.id);
  writer.writeLong(offsets[3], object.kind);
  writer.writeString(offsets[4], object.pubkey);
  writer.writeString(offsets[5], object.sig);
  writer.writeStringList(offsets[6], object.sources);
  writer.writeStringList(offsets[7], object.tagIndex);
  writer.writeString(offsets[8], object.tagsStr);
}

IsarEvent _isarEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarEvent();
  object.content = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readLongOrNull(offsets[1]);
  object.id = reader.readStringOrNull(offsets[2]);
  object.kind = reader.readLongOrNull(offsets[3]);
  object.pubkey = reader.readStringOrNull(offsets[4]);
  object.sig = reader.readStringOrNull(offsets[5]);
  object.sources = reader.readStringList(offsets[6]);
  object.tagIndex = reader.readStringList(offsets[7]);
  object.tagsStr = reader.readStringOrNull(offsets[8]);
  return object;
}

P _isarEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarEventGetId(IsarEvent object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarEventGetLinks(IsarEvent object) {
  return [];
}

void _isarEventAttach(IsarCollection<dynamic> col, Id id, IsarEvent object) {}

extension IsarEventQueryWhereSort
    on QueryBuilder<IsarEvent, IsarEvent, QWhere> {
  QueryBuilder<IsarEvent, IsarEvent, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhere> anyTagIndexElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tagIndex'),
      );
    });
  }
}

extension IsarEventQueryWhere
    on QueryBuilder<IsarEvent, IsarEvent, QWhereClause> {
  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindIsNullAnyPubkeyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kind_pubkey_createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindIsNotNullAnyPubkeyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindEqualToAnyPubkeyCreatedAt(int? kind) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kind_pubkey_createdAt',
        value: [kind],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindNotEqualToAnyPubkeyCreatedAt(int? kind) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [],
              upper: [kind],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [],
              upper: [kind],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindGreaterThanAnyPubkeyCreatedAt(
    int? kind, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [kind],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindLessThanAnyPubkeyCreatedAt(
    int? kind, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [],
        upper: [kind],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindBetweenAnyPubkeyCreatedAt(
    int? lowerKind,
    int? upperKind, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [lowerKind],
        includeLower: includeLower,
        upper: [upperKind],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindEqualToPubkeyIsNullAnyCreatedAt(int? kind) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kind_pubkey_createdAt',
        value: [kind, null],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindEqualToPubkeyIsNotNullAnyCreatedAt(int? kind) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [kind, null],
        includeLower: false,
        upper: [
          kind,
        ],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToAnyCreatedAt(int? kind, String? pubkey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kind_pubkey_createdAt',
        value: [kind, pubkey],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindEqualToPubkeyNotEqualToAnyCreatedAt(int? kind, String? pubkey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind],
              upper: [kind, pubkey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind, pubkey],
              includeLower: false,
              upper: [kind],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind, pubkey],
              includeLower: false,
              upper: [kind],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind],
              upper: [kind, pubkey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToCreatedAtIsNull(int? kind, String? pubkey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kind_pubkey_createdAt',
        value: [kind, pubkey, null],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToCreatedAtIsNotNull(int? kind, String? pubkey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [kind, pubkey, null],
        includeLower: false,
        upper: [
          kind,
          pubkey,
        ],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyCreatedAtEqualTo(int? kind, String? pubkey, int? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kind_pubkey_createdAt',
        value: [kind, pubkey, createdAt],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToCreatedAtNotEqualTo(
          int? kind, String? pubkey, int? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind, pubkey],
              upper: [kind, pubkey, createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind, pubkey, createdAt],
              includeLower: false,
              upper: [kind, pubkey],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind, pubkey, createdAt],
              includeLower: false,
              upper: [kind, pubkey],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kind_pubkey_createdAt',
              lower: [kind, pubkey],
              upper: [kind, pubkey, createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToCreatedAtGreaterThan(
    int? kind,
    String? pubkey,
    int? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [kind, pubkey, createdAt],
        includeLower: include,
        upper: [kind, pubkey],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToCreatedAtLessThan(
    int? kind,
    String? pubkey,
    int? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [kind, pubkey],
        upper: [kind, pubkey, createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      kindPubkeyEqualToCreatedAtBetween(
    int? kind,
    String? pubkey,
    int? lowerCreatedAt,
    int? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'kind_pubkey_createdAt',
        lower: [kind, pubkey, lowerCreatedAt],
        includeLower: includeLower,
        upper: [kind, pubkey, upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> tagIndexElementEqualTo(
      String tagIndexElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tagIndex',
        value: [tagIndexElement],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      tagIndexElementNotEqualTo(String tagIndexElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagIndex',
              lower: [],
              upper: [tagIndexElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagIndex',
              lower: [tagIndexElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagIndex',
              lower: [tagIndexElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagIndex',
              lower: [],
              upper: [tagIndexElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      tagIndexElementGreaterThan(
    String tagIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagIndex',
        lower: [tagIndexElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> tagIndexElementLessThan(
    String tagIndexElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagIndex',
        lower: [],
        upper: [tagIndexElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause> tagIndexElementBetween(
    String lowerTagIndexElement,
    String upperTagIndexElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagIndex',
        lower: [lowerTagIndexElement],
        includeLower: includeLower,
        upper: [upperTagIndexElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      tagIndexElementStartsWith(String TagIndexElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagIndex',
        lower: [TagIndexElementPrefix],
        upper: ['$TagIndexElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      tagIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tagIndex',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterWhereClause>
      tagIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tagIndex',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tagIndex',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tagIndex',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tagIndex',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarEventQueryFilter
    on QueryBuilder<IsarEvent, IsarEvent, QFilterCondition> {
  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> createdAtEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      createdAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> createdAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> createdAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> kindIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kind',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> kindIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kind',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> kindEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kind',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> kindGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kind',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> kindLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kind',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> kindBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kind',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pubkey',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pubkey',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pubkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pubkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pubkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pubkey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pubkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pubkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pubkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pubkey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pubkey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> pubkeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pubkey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sig',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sig',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sig',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sig',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sig',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sigIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sig',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sourcesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sources',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sourcesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sources',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sources',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sources',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sources',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sources',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> sourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      sourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tagIndex',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tagIndex',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tagsStr',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tagsStr',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagsStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagsStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagsStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagsStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagsStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagsStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagsStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagsStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition> tagsStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagsStr',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterFilterCondition>
      tagsStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagsStr',
        value: '',
      ));
    });
  }
}

extension IsarEventQueryObject
    on QueryBuilder<IsarEvent, IsarEvent, QFilterCondition> {}

extension IsarEventQueryLinks
    on QueryBuilder<IsarEvent, IsarEvent, QFilterCondition> {}

extension IsarEventQuerySortBy on QueryBuilder<IsarEvent, IsarEvent, QSortBy> {
  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByPubkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubkey', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByPubkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubkey', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortBySig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sig', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortBySigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sig', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByTagsStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsStr', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> sortByTagsStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsStr', Sort.desc);
    });
  }
}

extension IsarEventQuerySortThenBy
    on QueryBuilder<IsarEvent, IsarEvent, QSortThenBy> {
  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByPubkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubkey', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByPubkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubkey', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenBySig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sig', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenBySigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sig', Sort.desc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByTagsStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsStr', Sort.asc);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QAfterSortBy> thenByTagsStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsStr', Sort.desc);
    });
  }
}

extension IsarEventQueryWhereDistinct
    on QueryBuilder<IsarEvent, IsarEvent, QDistinct> {
  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kind');
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctByPubkey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pubkey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctBySig(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sig', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctBySources() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sources');
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctByTagIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagIndex');
    });
  }

  QueryBuilder<IsarEvent, IsarEvent, QDistinct> distinctByTagsStr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagsStr', caseSensitive: caseSensitive);
    });
  }
}

extension IsarEventQueryProperty
    on QueryBuilder<IsarEvent, IsarEvent, QQueryProperty> {
  QueryBuilder<IsarEvent, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarEvent, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<IsarEvent, int?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarEvent, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarEvent, int?, QQueryOperations> kindProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kind');
    });
  }

  QueryBuilder<IsarEvent, String?, QQueryOperations> pubkeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pubkey');
    });
  }

  QueryBuilder<IsarEvent, String?, QQueryOperations> sigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sig');
    });
  }

  QueryBuilder<IsarEvent, List<String>?, QQueryOperations> sourcesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sources');
    });
  }

  QueryBuilder<IsarEvent, List<String>?, QQueryOperations> tagIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagIndex');
    });
  }

  QueryBuilder<IsarEvent, String?, QQueryOperations> tagsStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagsStr');
    });
  }
}
