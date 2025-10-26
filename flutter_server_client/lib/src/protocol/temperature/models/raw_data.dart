/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../temperature/models/sensor.dart' as _i2;

/// A raw data is the raw temperature data from a sensor.
abstract class RawData implements _i1.SerializableModel {
  RawData._({
    this.id,
    required this.sensorId,
    this.sensor,
    required this.temperature,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory RawData({
    _i1.UuidValue? id,
    required _i1.UuidValue sensorId,
    _i2.Sensor? sensor,
    required double temperature,
    DateTime? createdAt,
  }) = _RawDataImpl;

  factory RawData.fromJson(Map<String, dynamic> jsonSerialization) {
    return RawData(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      sensorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['sensorId']),
      sensor: jsonSerialization['sensor'] == null
          ? null
          : _i2.Sensor.fromJson(
              (jsonSerialization['sensor'] as Map<String, dynamic>)),
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue sensorId;

  _i2.Sensor? sensor;

  double temperature;

  DateTime createdAt;

  /// Returns a shallow copy of this [RawData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RawData copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? sensorId,
    _i2.Sensor? sensor,
    double? temperature,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'sensorId': sensorId.toJson(),
      if (sensor != null) 'sensor': sensor?.toJson(),
      'temperature': temperature,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RawDataImpl extends RawData {
  _RawDataImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue sensorId,
    _i2.Sensor? sensor,
    required double temperature,
    DateTime? createdAt,
  }) : super._(
          id: id,
          sensorId: sensorId,
          sensor: sensor,
          temperature: temperature,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [RawData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RawData copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? sensorId,
    Object? sensor = _Undefined,
    double? temperature,
    DateTime? createdAt,
  }) {
    return RawData(
      id: id is _i1.UuidValue? ? id : this.id,
      sensorId: sensorId ?? this.sensorId,
      sensor: sensor is _i2.Sensor? ? sensor : this.sensor?.copyWith(),
      temperature: temperature ?? this.temperature,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
