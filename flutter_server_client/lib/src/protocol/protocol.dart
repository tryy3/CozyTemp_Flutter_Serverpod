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
import 'greeting.dart' as _i2;
import 'temperature/models/calibrated_temperature.dart' as _i3;
import 'temperature/models/calibration_input.dart' as _i4;
import 'temperature/models/collect_data.dart' as _i5;
import 'temperature/models/collect_data_temperature.dart' as _i6;
import 'temperature/models/node.dart' as _i7;
import 'temperature/models/raw_data.dart' as _i8;
import 'temperature/models/sensor.dart' as _i9;
import 'package:flutter_server_client/src/protocol/temperature/models/node.dart'
    as _i10;
import 'package:flutter_server_client/src/protocol/temperature/models/raw_data.dart'
    as _i11;
import 'package:flutter_server_client/src/protocol/temperature/models/calibration_input.dart'
    as _i12;
export 'greeting.dart';
export 'temperature/models/calibrated_temperature.dart';
export 'temperature/models/calibration_input.dart';
export 'temperature/models/collect_data.dart';
export 'temperature/models/collect_data_temperature.dart';
export 'temperature/models/node.dart';
export 'temperature/models/raw_data.dart';
export 'temperature/models/sensor.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.CalibratedTemperature) {
      return _i3.CalibratedTemperature.fromJson(data) as T;
    }
    if (t == _i4.CalibrationInput) {
      return _i4.CalibrationInput.fromJson(data) as T;
    }
    if (t == _i5.CollectData) {
      return _i5.CollectData.fromJson(data) as T;
    }
    if (t == _i6.CollectDataTemperature) {
      return _i6.CollectDataTemperature.fromJson(data) as T;
    }
    if (t == _i7.Node) {
      return _i7.Node.fromJson(data) as T;
    }
    if (t == _i8.RawData) {
      return _i8.RawData.fromJson(data) as T;
    }
    if (t == _i9.Sensor) {
      return _i9.Sensor.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CalibratedTemperature?>()) {
      return (data != null ? _i3.CalibratedTemperature.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.CalibrationInput?>()) {
      return (data != null ? _i4.CalibrationInput.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CollectData?>()) {
      return (data != null ? _i5.CollectData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CollectDataTemperature?>()) {
      return (data != null ? _i6.CollectDataTemperature.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.Node?>()) {
      return (data != null ? _i7.Node.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.RawData?>()) {
      return (data != null ? _i8.RawData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Sensor?>()) {
      return (data != null ? _i9.Sensor.fromJson(data) : null) as T;
    }
    if (t == List<_i6.CollectDataTemperature>) {
      return (data as List)
              .map((e) => deserialize<_i6.CollectDataTemperature>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.Sensor>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i9.Sensor>(e)).toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i8.RawData>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i8.RawData>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i10.Node>) {
      return (data as List).map((e) => deserialize<_i10.Node>(e)).toList() as T;
    }
    if (t == List<_i11.RawData>) {
      return (data as List).map((e) => deserialize<_i11.RawData>(e)).toList()
          as T;
    }
    if (t == List<_i12.CalibrationInput>) {
      return (data as List)
              .map((e) => deserialize<_i12.CalibrationInput>(e))
              .toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    switch (data) {
      case _i2.Greeting():
        return 'Greeting';
      case _i3.CalibratedTemperature():
        return 'CalibratedTemperature';
      case _i4.CalibrationInput():
        return 'CalibrationInput';
      case _i5.CollectData():
        return 'CollectData';
      case _i6.CollectDataTemperature():
        return 'CollectDataTemperature';
      case _i7.Node():
        return 'Node';
      case _i8.RawData():
        return 'RawData';
      case _i9.Sensor():
        return 'Sensor';
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
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'CalibratedTemperature') {
      return deserialize<_i3.CalibratedTemperature>(data['data']);
    }
    if (dataClassName == 'CalibrationInput') {
      return deserialize<_i4.CalibrationInput>(data['data']);
    }
    if (dataClassName == 'CollectData') {
      return deserialize<_i5.CollectData>(data['data']);
    }
    if (dataClassName == 'CollectDataTemperature') {
      return deserialize<_i6.CollectDataTemperature>(data['data']);
    }
    if (dataClassName == 'Node') {
      return deserialize<_i7.Node>(data['data']);
    }
    if (dataClassName == 'RawData') {
      return deserialize<_i8.RawData>(data['data']);
    }
    if (dataClassName == 'Sensor') {
      return deserialize<_i9.Sensor>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
