// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_cache.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInsightCacheCollection on Isar {
  IsarCollection<InsightCache> get insightCaches => this.collection();
}

const InsightCacheSchema = CollectionSchema(
  name: r'InsightCache',
  id: -5819901839787793772,
  properties: {
    r'expiresAt': PropertySchema(
      id: 0,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'generatedAt': PropertySchema(
      id: 1,
      name: r'generatedAt',
      type: IsarType.dateTime,
    ),
    r'insightText': PropertySchema(
      id: 2,
      name: r'insightText',
      type: IsarType.string,
    ),
    r'isFromAi': PropertySchema(
      id: 3,
      name: r'isFromAi',
      type: IsarType.bool,
    )
  },
  estimateSize: _insightCacheEstimateSize,
  serialize: _insightCacheSerialize,
  deserialize: _insightCacheDeserialize,
  deserializeProp: _insightCacheDeserializeProp,
  idName: r'id',
  indexes: {
    r'generatedAt': IndexSchema(
      id: 4527473099475400258,
      name: r'generatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'generatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _insightCacheGetId,
  getLinks: _insightCacheGetLinks,
  attach: _insightCacheAttach,
  version: '3.1.0+1',
);

int _insightCacheEstimateSize(
  InsightCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.insightText.length * 3;
  return bytesCount;
}

void _insightCacheSerialize(
  InsightCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.expiresAt);
  writer.writeDateTime(offsets[1], object.generatedAt);
  writer.writeString(offsets[2], object.insightText);
  writer.writeBool(offsets[3], object.isFromAi);
}

InsightCache _insightCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InsightCache();
  object.expiresAt = reader.readDateTimeOrNull(offsets[0]);
  object.generatedAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.insightText = reader.readString(offsets[2]);
  object.isFromAi = reader.readBool(offsets[3]);
  return object;
}

P _insightCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _insightCacheGetId(InsightCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _insightCacheGetLinks(InsightCache object) {
  return [];
}

void _insightCacheAttach(
    IsarCollection<dynamic> col, Id id, InsightCache object) {
  object.id = id;
}

extension InsightCacheQueryWhereSort
    on QueryBuilder<InsightCache, InsightCache, QWhere> {
  QueryBuilder<InsightCache, InsightCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhere> anyGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'generatedAt'),
      );
    });
  }
}

extension InsightCacheQueryWhere
    on QueryBuilder<InsightCache, InsightCache, QWhereClause> {
  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause>
      generatedAtEqualTo(DateTime generatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'generatedAt',
        value: [generatedAt],
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause>
      generatedAtNotEqualTo(DateTime generatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [],
              upper: [generatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [generatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [generatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [],
              upper: [generatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause>
      generatedAtGreaterThan(
    DateTime generatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'generatedAt',
        lower: [generatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause>
      generatedAtLessThan(
    DateTime generatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'generatedAt',
        lower: [],
        upper: [generatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterWhereClause>
      generatedAtBetween(
    DateTime lowerGeneratedAt,
    DateTime upperGeneratedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'generatedAt',
        lower: [lowerGeneratedAt],
        includeLower: includeLower,
        upper: [upperGeneratedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InsightCacheQueryFilter
    on QueryBuilder<InsightCache, InsightCache, QFilterCondition> {
  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      expiresAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiresAt',
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      expiresAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiresAt',
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      expiresAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      expiresAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      expiresAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      expiresAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      generatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      generatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      generatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      generatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insightText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'insightText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'insightText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'insightText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'insightText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'insightText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'insightText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'insightText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insightText',
        value: '',
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      insightTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'insightText',
        value: '',
      ));
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterFilterCondition>
      isFromAiEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFromAi',
        value: value,
      ));
    });
  }
}

extension InsightCacheQueryObject
    on QueryBuilder<InsightCache, InsightCache, QFilterCondition> {}

extension InsightCacheQueryLinks
    on QueryBuilder<InsightCache, InsightCache, QFilterCondition> {}

extension InsightCacheQuerySortBy
    on QueryBuilder<InsightCache, InsightCache, QSortBy> {
  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> sortByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy>
      sortByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> sortByInsightText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightText', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy>
      sortByInsightTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightText', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> sortByIsFromAi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromAi', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> sortByIsFromAiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromAi', Sort.desc);
    });
  }
}

extension InsightCacheQuerySortThenBy
    on QueryBuilder<InsightCache, InsightCache, QSortThenBy> {
  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy>
      thenByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByInsightText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightText', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy>
      thenByInsightTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightText', Sort.desc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByIsFromAi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromAi', Sort.asc);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QAfterSortBy> thenByIsFromAiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFromAi', Sort.desc);
    });
  }
}

extension InsightCacheQueryWhereDistinct
    on QueryBuilder<InsightCache, InsightCache, QDistinct> {
  QueryBuilder<InsightCache, InsightCache, QDistinct> distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<InsightCache, InsightCache, QDistinct> distinctByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAt');
    });
  }

  QueryBuilder<InsightCache, InsightCache, QDistinct> distinctByInsightText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'insightText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InsightCache, InsightCache, QDistinct> distinctByIsFromAi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFromAi');
    });
  }
}

extension InsightCacheQueryProperty
    on QueryBuilder<InsightCache, InsightCache, QQueryProperty> {
  QueryBuilder<InsightCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InsightCache, DateTime?, QQueryOperations> expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<InsightCache, DateTime, QQueryOperations> generatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAt');
    });
  }

  QueryBuilder<InsightCache, String, QQueryOperations> insightTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'insightText');
    });
  }

  QueryBuilder<InsightCache, bool, QQueryOperations> isFromAiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFromAi');
    });
  }
}
