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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../temperature/models/raw_data.dart' as _i2;

/// Calibrated temperature data adjusted from raw sensor readings
abstract class CalibratedTemperature implements _i1.SerializableModel {
  CalibratedTemperature._({
    this.id,
    this.rawDataId,
    this.rawData,
    required this.temperature,
    DateTime? calibratedAt,
  }) : calibratedAt = calibratedAt ?? DateTime.now();

  factory CalibratedTemperature({
    _i1.UuidValue? id,
    _i1.UuidValue? rawDataId,
    _i2.RawData? rawData,
    required double temperature,
    DateTime? calibratedAt,
  }) = _CalibratedTemperatureImpl;

  factory CalibratedTemperature.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CalibratedTemperature(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      rawDataId: jsonSerialization['rawDataId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['rawDataId']),
      rawData: jsonSerialization['rawData'] == null
          ? null
          : _i2.RawData.fromJson(
              (jsonSerialization['rawData'] as Map<String, dynamic>)),
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
      calibratedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['calibratedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue? rawDataId;

  _i2.RawData? rawData;

  double temperature;

  DateTime calibratedAt;

  /// Returns a shallow copy of this [CalibratedTemperature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CalibratedTemperature copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? rawDataId,
    _i2.RawData? rawData,
    double? temperature,
    DateTime? calibratedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      if (rawDataId != null) 'rawDataId': rawDataId?.toJson(),
      if (rawData != null) 'rawData': rawData?.toJson(),
      'temperature': temperature,
      'calibratedAt': calibratedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CalibratedTemperatureImpl extends CalibratedTemperature {
  _CalibratedTemperatureImpl({
    _i1.UuidValue? id,
    _i1.UuidValue? rawDataId,
    _i2.RawData? rawData,
    required double temperature,
    DateTime? calibratedAt,
  }) : super._(
          id: id,
          rawDataId: rawDataId,
          rawData: rawData,
          temperature: temperature,
          calibratedAt: calibratedAt,
        );

  /// Returns a shallow copy of this [CalibratedTemperature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CalibratedTemperature copyWith({
    Object? id = _Undefined,
    Object? rawDataId = _Undefined,
    Object? rawData = _Undefined,
    double? temperature,
    DateTime? calibratedAt,
  }) {
    return CalibratedTemperature(
      id: id is _i1.UuidValue? ? id : this.id,
      rawDataId: rawDataId is _i1.UuidValue? ? rawDataId : this.rawDataId,
      rawData: rawData is _i2.RawData? ? rawData : this.rawData?.copyWith(),
      temperature: temperature ?? this.temperature,
      calibratedAt: calibratedAt ?? this.calibratedAt,
    );
  }
}
