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
    r'bloating': PropertySchema(
      id: 1,
      name: r'bloating',
      type: IsarType.bool,
    ),
    r'clientId': PropertySchema(
      id: 2,
      name: r'clientId',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 3,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'difficultyConceiving': PropertySchema(
      id: 4,
      name: r'difficultyConceiving',
      type: IsarType.bool,
    ),
    r'familyHistory': PropertySchema(
      id: 5,
      name: r'familyHistory',
      type: IsarType.bool,
    ),
    r'fatigue': PropertySchema(
      id: 6,
      name: r'fatigue',
      type: IsarType.bool,
    ),
    r'hairGrowth': PropertySchema(
      id: 7,
      name: r'hairGrowth',
      type: IsarType.bool,
    ),
    r'hairThinning': PropertySchema(
      id: 8,
      name: r'hairThinning',
      type: IsarType.bool,
    ),
    r'irregularCycle': PropertySchema(
      id: 9,
      name: r'irregularCycle',
      type: IsarType.bool,
    ),
    r'isDeleted': PropertySchema(
      id: 10,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'moodIssues': PropertySchema(
      id: 11,
      name: r'moodIssues',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 12,
      name: r'notes',
      type: IsarType.string,
    ),
    r'skinDarkening': PropertySchema(
      id: 13,
      name: r'skinDarkening',
      type: IsarType.bool,
    ),
    r'sleepProblems': PropertySchema(
      id: 14,
      name: r'sleepProblems',
      type: IsarType.bool,
    ),
    r'synced': PropertySchema(
      id: 15,
      name: r'synced',
      type: IsarType.bool,
    ),
    r'timestamp': PropertySchema(
      id: 16,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'weightGain': PropertySchema(
      id: 18,
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
    r'clientId': IndexSchema(
      id: 2639372232964765565,
      name: r'clientId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'clientId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
    final value = object.clientId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deviceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  writer.writeBool(offsets[1], object.bloating);
  writer.writeString(offsets[2], object.clientId);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeBool(offsets[4], object.difficultyConceiving);
  writer.writeBool(offsets[5], object.familyHistory);
  writer.writeBool(offsets[6], object.fatigue);
  writer.writeBool(offsets[7], object.hairGrowth);
  writer.writeBool(offsets[8], object.hairThinning);
  writer.writeBool(offsets[9], object.irregularCycle);
  writer.writeBool(offsets[10], object.isDeleted);
  writer.writeBool(offsets[11], object.moodIssues);
  writer.writeString(offsets[12], object.notes);
  writer.writeBool(offsets[13], object.skinDarkening);
  writer.writeBool(offsets[14], object.sleepProblems);
  writer.writeBool(offsets[15], object.synced);
  writer.writeDateTime(offsets[16], object.timestamp);
  writer.writeDateTime(offsets[17], object.updatedAt);
  writer.writeBool(offsets[18], object.weightGain);
}

SymptomLog _symptomLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SymptomLog();
  object.acne = reader.readBool(offsets[0]);
  object.bloating = reader.readBool(offsets[1]);
  object.clientId = reader.readStringOrNull(offsets[2]);
  object.deviceId = reader.readStringOrNull(offsets[3]);
  object.difficultyConceiving = reader.readBool(offsets[4]);
  object.familyHistory = reader.readBool(offsets[5]);
  object.fatigue = reader.readBool(offsets[6]);
  object.hairGrowth = reader.readBool(offsets[7]);
  object.hairThinning = reader.readBool(offsets[8]);
  object.id = id;
  object.irregularCycle = reader.readBool(offsets[9]);
  object.isDeleted = reader.readBool(offsets[10]);
  object.moodIssues = reader.readBool(offsets[11]);
  object.notes = reader.readStringOrNull(offsets[12]);
  object.skinDarkening = reader.readBool(offsets[13]);
  object.sleepProblems = reader.readBool(offsets[14]);
  object.synced = reader.readBool(offsets[15]);
  object.timestamp = reader.readDateTime(offsets[16]);
  object.updatedAt = reader.readDateTime(offsets[17]);
  object.weightGain = reader.readBool(offsets[18]);
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
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

extension SymptomLogByIndex on IsarCollection<SymptomLog> {
  Future<SymptomLog?> getByClientId(String? clientId) {
    return getByIndex(r'clientId', [clientId]);
  }

  SymptomLog? getByClientIdSync(String? clientId) {
    return getByIndexSync(r'clientId', [clientId]);
  }

  Future<bool> deleteByClientId(String? clientId) {
    return deleteByIndex(r'clientId', [clientId]);
  }

  bool deleteByClientIdSync(String? clientId) {
    return deleteByIndexSync(r'clientId', [clientId]);
  }

  Future<List<SymptomLog?>> getAllByClientId(List<String?> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'clientId', values);
  }

  List<SymptomLog?> getAllByClientIdSync(List<String?> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'clientId', values);
  }

  Future<int> deleteAllByClientId(List<String?> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'clientId', values);
  }

  int deleteAllByClientIdSync(List<String?> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'clientId', values);
  }

  Future<Id> putByClientId(SymptomLog object) {
    return putByIndex(r'clientId', object);
  }

  Id putByClientIdSync(SymptomLog object, {bool saveLinks = true}) {
    return putByIndexSync(r'clientId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClientId(List<SymptomLog> objects) {
    return putAllByIndex(r'clientId', objects);
  }

  List<Id> putAllByClientIdSync(List<SymptomLog> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'clientId', objects, saveLinks: saveLinks);
  }
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> clientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientId',
        value: [null],
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> clientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clientId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> clientIdEqualTo(
      String? clientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientId',
        value: [clientId],
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterWhereClause> clientIdNotEqualTo(
      String? clientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [],
              upper: [clientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [clientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [clientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [],
              upper: [clientId],
              includeUpper: false,
            ));
      }
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> bloatingEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloating',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientId',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      clientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientId',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      clientIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      clientIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> clientIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      clientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientId',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      clientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientId',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceId',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      deviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceId',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      deviceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      difficultyConceivingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficultyConceiving',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      familyHistoryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'familyHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> fatigueEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatigue',
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      hairThinningEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hairThinning',
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> isDeletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      skinDarkeningEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skinDarkening',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      sleepProblemsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepProblems',
        value: value,
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByBloating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloating', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByBloatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloating', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByClientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByClientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy>
      sortByDifficultyConceiving() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficultyConceiving', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy>
      sortByDifficultyConceivingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficultyConceiving', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByFamilyHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'familyHistory', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByFamilyHistoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'familyHistory', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByFatigue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatigue', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByFatigueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatigue', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByHairThinning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairThinning', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByHairThinningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairThinning', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortBySkinDarkening() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skinDarkening', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortBySkinDarkeningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skinDarkening', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortBySleepProblems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepProblems', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortBySleepProblemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepProblems', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByBloating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloating', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByBloatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloating', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByClientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByClientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy>
      thenByDifficultyConceiving() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficultyConceiving', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy>
      thenByDifficultyConceivingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficultyConceiving', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByFamilyHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'familyHistory', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByFamilyHistoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'familyHistory', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByFatigue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatigue', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByFatigueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatigue', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByHairThinning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairThinning', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByHairThinningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hairThinning', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenBySkinDarkening() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skinDarkening', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenBySkinDarkeningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skinDarkening', Sort.desc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenBySleepProblems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepProblems', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenBySleepProblemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepProblems', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
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

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByBloating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bloating');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByClientId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct>
      distinctByDifficultyConceiving() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficultyConceiving');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByFamilyHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'familyHistory');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByFatigue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fatigue');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByHairGrowth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hairGrowth');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByHairThinning() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hairThinning');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByIrregularCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'irregularCycle');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
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

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctBySkinDarkening() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skinDarkening');
    });
  }

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctBySleepProblems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepProblems');
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

  QueryBuilder<SymptomLog, SymptomLog, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
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

  QueryBuilder<SymptomLog, bool, QQueryOperations> bloatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bloating');
    });
  }

  QueryBuilder<SymptomLog, String?, QQueryOperations> clientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientId');
    });
  }

  QueryBuilder<SymptomLog, String?, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations>
      difficultyConceivingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficultyConceiving');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> familyHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'familyHistory');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> fatigueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatigue');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> hairGrowthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hairGrowth');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> hairThinningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hairThinning');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> irregularCycleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'irregularCycle');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
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

  QueryBuilder<SymptomLog, bool, QQueryOperations> skinDarkeningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skinDarkening');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> sleepProblemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepProblems');
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

  QueryBuilder<SymptomLog, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SymptomLog, bool, QQueryOperations> weightGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightGain');
    });
  }
}
