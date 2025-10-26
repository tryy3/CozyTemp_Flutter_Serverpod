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
import 'temperature/models/node.dart' as _i3;
import 'temperature/models/raw_data.dart' as _i4;
import 'temperature/models/sensor.dart' as _i5;
export 'greeting.dart';
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
    if (t == _i3.Node) {
      return _i3.Node.fromJson(data) as T;
    }
    if (t == _i4.RawData) {
      return _i4.RawData.fromJson(data) as T;
    }
    if (t == _i5.Sensor) {
      return _i5.Sensor.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Node?>()) {
      return (data != null ? _i3.Node.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.RawData?>()) {
      return (data != null ? _i4.RawData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Sensor?>()) {
      return (data != null ? _i5.Sensor.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i5.Sensor>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.Sensor>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i4.RawData>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i4.RawData>(e)).toList()
          : null) as T;
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
    if (data is _i3.Node) {
      return 'Node';
    }
    if (data is _i4.RawData) {
      return 'RawData';
    }
    if (data is _i5.Sensor) {
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
    if (dataClassName == 'Node') {
      return deserialize<_i3.Node>(data['data']);
    }
    if (dataClassName == 'RawData') {
      return deserialize<_i4.RawData>(data['data']);
    }
    if (dataClassName == 'Sensor') {
      return deserialize<_i5.Sensor>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
