/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'greeting.dart' as _i3;
import 'temperature/models/calibrated_temperature.dart' as _i4;
import 'temperature/models/calibration_input.dart' as _i5;
import 'temperature/models/collect_data.dart' as _i6;
import 'temperature/models/collect_data_temperature.dart' as _i7;
import 'temperature/models/node.dart' as _i8;
import 'temperature/models/raw_data.dart' as _i9;
import 'temperature/models/sensor.dart' as _i10;
import 'package:flutter_server_server/src/generated/temperature/models/node.dart'
    as _i11;
import 'package:flutter_server_server/src/generated/temperature/models/raw_data.dart'
    as _i12;
import 'package:flutter_server_server/src/generated/temperature/models/calibration_input.dart'
    as _i13;
export 'greeting.dart';
export 'temperature/models/calibrated_temperature.dart';
export 'temperature/models/calibration_input.dart';
export 'temperature/models/collect_data.dart';
export 'temperature/models/collect_data_temperature.dart';
export 'temperature/models/node.dart';
export 'temperature/models/raw_data.dart';
export 'temperature/models/sensor.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'calibrated_temperature',
      dartName: 'CalibratedTemperature',
      schema: 'public',
      module: 'flutter_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'rawDataId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'temperature',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'calibratedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'calibrated_temperature_fk_0',
          columns: ['rawDataId'],
          referenceTable: 'raw_data',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'calibrated_temperature_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'raw_data_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rawDataId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'nodes',
      dartName: 'Node',
      schema: 'public',
      module: 'flutter_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'identifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'nodes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'node_identifier_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'identifier',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'raw_data',
      dartName: 'RawData',
      schema: 'public',
      module: 'flutter_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'sensorId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'temperature',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'raw_data_fk_0',
          columns: ['sensorId'],
          referenceTable: 'sensors',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'raw_data_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'raw_data_sensor_time_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'sensorId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'raw_data_created_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'sensors',
      dartName: 'Sensor',
      schema: 'public',
      module: 'flutter_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'parentNodeId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'identifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'sensors_fk_0',
          columns: ['parentNodeId'],
          referenceTable: 'nodes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sensors_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'sensor_identifier_node_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'identifier',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'parentNodeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Greeting) {
      return _i3.Greeting.fromJson(data) as T;
    }
    if (t == _i4.CalibratedTemperature) {
      return _i4.CalibratedTemperature.fromJson(data) as T;
    }
    if (t == _i5.CalibrationInput) {
      return _i5.CalibrationInput.fromJson(data) as T;
    }
    if (t == _i6.CollectData) {
      return _i6.CollectData.fromJson(data) as T;
    }
    if (t == _i7.CollectDataTemperature) {
      return _i7.CollectDataTemperature.fromJson(data) as T;
    }
    if (t == _i8.Node) {
      return _i8.Node.fromJson(data) as T;
    }
    if (t == _i9.RawData) {
      return _i9.RawData.fromJson(data) as T;
    }
    if (t == _i10.Sensor) {
      return _i10.Sensor.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Greeting?>()) {
      return (data != null ? _i3.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CalibratedTemperature?>()) {
      return (data != null ? _i4.CalibratedTemperature.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.CalibrationInput?>()) {
      return (data != null ? _i5.CalibrationInput.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CollectData?>()) {
      return (data != null ? _i6.CollectData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CollectDataTemperature?>()) {
      return (data != null ? _i7.CollectDataTemperature.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.Node?>()) {
      return (data != null ? _i8.Node.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RawData?>()) {
      return (data != null ? _i9.RawData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Sensor?>()) {
      return (data != null ? _i10.Sensor.fromJson(data) : null) as T;
    }
    if (t == List<_i7.CollectDataTemperature>) {
      return (data as List)
              .map((e) => deserialize<_i7.CollectDataTemperature>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i10.Sensor>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i10.Sensor>(e)).toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i9.RawData>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i9.RawData>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i11.Node>) {
      return (data as List).map((e) => deserialize<_i11.Node>(e)).toList() as T;
    }
    if (t == List<_i12.RawData>) {
      return (data as List).map((e) => deserialize<_i12.RawData>(e)).toList()
          as T;
    }
    if (t == List<_i13.CalibrationInput>) {
      return (data as List)
              .map((e) => deserialize<_i13.CalibrationInput>(e))
              .toList()
          as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    switch (data) {
      case _i3.Greeting():
        return 'Greeting';
      case _i4.CalibratedTemperature():
        return 'CalibratedTemperature';
      case _i5.CalibrationInput():
        return 'CalibrationInput';
      case _i6.CollectData():
        return 'CollectData';
      case _i7.CollectDataTemperature():
        return 'CollectDataTemperature';
      case _i8.Node():
        return 'Node';
      case _i9.RawData():
        return 'RawData';
      case _i10.Sensor():
        return 'Sensor';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i3.Greeting>(data['data']);
    }
    if (dataClassName == 'CalibratedTemperature') {
      return deserialize<_i4.CalibratedTemperature>(data['data']);
    }
    if (dataClassName == 'CalibrationInput') {
      return deserialize<_i5.CalibrationInput>(data['data']);
    }
    if (dataClassName == 'CollectData') {
      return deserialize<_i6.CollectData>(data['data']);
    }
    if (dataClassName == 'CollectDataTemperature') {
      return deserialize<_i7.CollectDataTemperature>(data['data']);
    }
    if (dataClassName == 'Node') {
      return deserialize<_i8.Node>(data['data']);
    }
    if (dataClassName == 'RawData') {
      return deserialize<_i9.RawData>(data['data']);
    }
    if (dataClassName == 'Sensor') {
      return deserialize<_i10.Sensor>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.CalibratedTemperature:
        return _i4.CalibratedTemperature.t;
      case _i8.Node:
        return _i8.Node.t;
      case _i9.RawData:
        return _i9.RawData.t;
      case _i10.Sensor:
        return _i10.Sensor.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'flutter_server';
}
