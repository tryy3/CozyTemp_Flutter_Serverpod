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
import 'greeting.dart' as _i2;
import 'temperature/models/collect_data.dart' as _i3;
import 'temperature/models/collect_data_temperature.dart' as _i4;
import 'temperature/models/node.dart' as _i5;
import 'temperature/models/raw_data.dart' as _i6;
import 'temperature/models/sensor.dart' as _i7;
import 'package:flutter_server_client/src/protocol/temperature/models/node.dart'
    as _i8;
export 'greeting.dart';
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
    if (t == _i3.CollectData) {
      return _i3.CollectData.fromJson(data) as T;
    }
    if (t == _i4.CollectDataTemperature) {
      return _i4.CollectDataTemperature.fromJson(data) as T;
    }
    if (t == _i5.Node) {
      return _i5.Node.fromJson(data) as T;
    }
    if (t == _i6.RawData) {
      return _i6.RawData.fromJson(data) as T;
    }
    if (t == _i7.Sensor) {
      return _i7.Sensor.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CollectData?>()) {
      return (data != null ? _i3.CollectData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CollectDataTemperature?>()) {
      return (data != null ? _i4.CollectDataTemperature.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.Node?>()) {
      return (data != null ? _i5.Node.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.RawData?>()) {
      return (data != null ? _i6.RawData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Sensor?>()) {
      return (data != null ? _i7.Sensor.fromJson(data) : null) as T;
    }
    if (t == List<_i4.CollectDataTemperature>) {
      return (data as List)
          .map((e) => deserialize<_i4.CollectDataTemperature>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i7.Sensor>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Sensor>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i6.RawData>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.RawData>(e)).toList()
          : null) as T;
    }
    if (t == List<_i8.Node>) {
      return (data as List).map((e) => deserialize<_i8.Node>(e)).toList() as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.CollectData) {
      return 'CollectData';
    }
    if (data is _i4.CollectDataTemperature) {
      return 'CollectDataTemperature';
    }
    if (data is _i5.Node) {
      return 'Node';
    }
    if (data is _i6.RawData) {
      return 'RawData';
    }
    if (data is _i7.Sensor) {
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
    if (dataClassName == 'CollectData') {
      return deserialize<_i3.CollectData>(data['data']);
    }
    if (dataClassName == 'CollectDataTemperature') {
      return deserialize<_i4.CollectDataTemperature>(data['data']);
    }
    if (dataClassName == 'Node') {
      return deserialize<_i5.Node>(data['data']);
    }
    if (dataClassName == 'RawData') {
      return deserialize<_i6.RawData>(data['data']);
    }
    if (dataClassName == 'Sensor') {
      return deserialize<_i7.Sensor>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
