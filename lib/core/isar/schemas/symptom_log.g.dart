// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSymptomLogCollection on Isar {
  IsarCollection<SymptomLog> get symptomLogs => this.collection();
}

const SymptomLogSchema = CollectionSchema(
  name: r'SymptomLog',
  id: -5879352961672105577,
  properties: {
    r'acne': PropertySchema(
      id: 0,
      name: r'acne',
      type: IsarType.bool,
    ),
    r'hairGrowth': PropertySchema(
      id: 1,
      name: r'hairGrowth',
      type: IsarType.bool,
    ),
    r'irregularCycle': PropertySchema(
      id: 2,
      name: r'irregularCycle',
      type: IsarType.bool,
    ),
    r'moodIssues': PropertySchema(
      id: 3,
      name: r'moodIssues',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    ),
    r'synced': PropertySchema(
      id: 5,
      name: r'synced',
      type: IsarType.bool,
    ),
    r'timestamp': PropertySchema(
      id: 6,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'weightGain': PropertySchema(
      id: 7,
      name: r'weightGain',
      type: IsarType.bool,
    )
  },
  estimateSize: _symptomLogEstimateSize,
  serialize: _symptomLogSerialize,
  deserialize: _symptomLogDeserialize,
  deserializeProp: _symptomLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _symptomLogGetId,
  getLinks: _symptomLogGetLinks,
  attach: _symptomLogAttach,
  version: '3.1.0+1',
);

int _symptomLogEstimateSize(
  SymptomLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _symptomLogSerialize(
  SymptomLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.acne);
  writer.writeBool(offsets[1], object.hairGrowth);
  writer.writeBool(offsets[2], object.irregularCycle);
  writer.writeBool(offsets[3], object.moodIssues);
  writer.writeString(offsets[4], object.notes);
  writer.writeBool(offsets[5], object.synced);
  writer.writeDateTime(offsets[6], object.timestamp);
  writer.writeBool(offsets[7], object.weightGain);
}

SymptomLog _symptomLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SymptomLog();
  object.acne = reader.readBool(offsets[0]);
  object.hairGrowth = reader.readBool(offsets[1]);
  object.id = id;
  object.irregularCycle = reader.readBool(offsets[2]);
  object.moodIssues = reader.readBool(offsets[3]);
  object.notes = reader.readStringOrNull(offsets[4]);
  object.synced = reader.readBool(offsets[5]);
  object.timestamp = reader.readDateTime(offsets[6]);
  object.weightGain = reader.readBool(offsets[7]);
  return object;
}

P _symptomLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _symptomLogGetId(SymptomLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _symptomLogGetLinks(SymptomLog object) {
  return [];
}

void _symptomLogAttach(IsarCollection<dynamic> col, Id id, SymptomLog object) {
  object.id = id;
}

extension SymptomLogQueryWhereSort
    on QueryBuilder<SymptomLog, SymptomLog, QWhere> {
  QueryBuilder<SymptomLog, SymptomLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhere> anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension SymptomLogQueryWhere
    on QueryBuilder<SymptomLog, SymptomLog, QWhereClause> {
  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> timestampEqualTo(
      DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [timestamp],
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> timestampNotEqualTo(
      DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> timestampGreaterThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [timestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> timestampLessThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [],
        upper: [timestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [lowerTimestamp],
        includeLower: includeLower,
        upper: [upperTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SymptomLogQueryFilter
    on QueryBuilder<SymptomLog, SymptomLog, QFilterCondition> {
  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> acneEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acne',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> hairGrowthEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hairGrowth',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      irregularCycleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'irregularCycle',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> moodIssuesEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moodIssues',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> syncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'synced',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> weightGainEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightGain',
        value: value,
      ));
    });
  }
}

extension SymptomLogQueryObject
    on QueryBuilder<SymptomLog, SymptomLog, QFilterCondition> {}

extension SymptomLogQueryLinks
    on QueryBuilder<SymptomLog, SymptomLog, QFilterCondition> {}

extension SymptomLogQuerySortBy
    on QueryBuilder<SymptomLog, SymptomLog, QSortBy> {
  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByAcne() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acne', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByAcneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acne', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByHairGrowth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairGrowth', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByHairGrowthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairGrowth', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByIrregularCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'irregularCycle', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy>
      sortByIrregularCycleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'irregularCycle', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByMoodIssues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodIssues', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByMoodIssuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodIssues', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortBySynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortBySyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByWeightGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGain', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByWeightGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGain', Sort.desc);
    });
  }
}

extension SymptomLogQuerySortThenBy
    on QueryBuilder<SymptomLog, SymptomLog, QSortThenBy> {
  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByAcne() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acne', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByAcneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acne', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByHairGrowth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairGrowth', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByHairGrowthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairGrowth', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByIrregularCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'irregularCycle', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy>
      thenByIrregularCycleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'irregularCycle', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByMoodIssues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodIssues', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByMoodIssuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moodIssues', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenBySynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenBySyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synced', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByWeightGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGain', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByWeightGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGain', Sort.desc);
    });
  }
}

extension SymptomLogQueryWhereDistinct
    on QueryBuilder<SymptomLog, SymptomLog, QDistinct> {
  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByAcne() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acne');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByHairGrowth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hairGrowth');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByIrregularCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'irregularCycle');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByMoodIssues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moodIssues');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctBySynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'synced');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByWeightGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightGain');
    });
  }
}

extension SymptomLogQueryProperty
    on QueryBuilder<SymptomLog, SymptomLog, QQueryProperty> {
  QueryBuilder<SymptomLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> acneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acne');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> hairGrowthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hairGrowth');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> irregularCycleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'irregularCycle');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> moodIssuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moodIssues');
    });
  }

  QueryBuilder<SymptomLog, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> syncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'synced');
    });
  }

  QueryBuilder<SymptomLog, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> weightGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightGain');
    });
  }
}
