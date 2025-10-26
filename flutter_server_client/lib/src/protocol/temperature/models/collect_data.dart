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
import '../../temperature/models/collect_data_temperature.dart' as _i2;

abstract class CollectData implements _i1.SerializableModel {
  CollectData._({
    required this.nodeIdentifier,
    required this.data,
  });

  factory CollectData({
    required String nodeIdentifier,
    required List<_i2.CollectDataTemperature> data,
  }) = _CollectDataImpl;

  factory CollectData.fromJson(Map<String, dynamic> jsonSerialization) {
    return CollectData(
      nodeIdentifier: jsonSerialization['nodeIdentifier'] as String,
      data: (jsonSerialization['data'] as List)
          .map((e) =>
              _i2.CollectDataTemperature.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  String nodeIdentifier;

  List<_i2.CollectDataTemperature> data;

  /// Returns a shallow copy of this [CollectData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CollectData copyWith({
    String? nodeIdentifier,
    List<_i2.CollectDataTemperature>? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'nodeIdentifier': nodeIdentifier,
      'data': data.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CollectDataImpl extends CollectData {
  _CollectDataImpl({
    required String nodeIdentifier,
    required List<_i2.CollectDataTemperature> data,
  }) : super._(
          nodeIdentifier: nodeIdentifier,
          data: data,
        );

  /// Returns a shallow copy of this [CollectData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CollectData copyWith({
    String? nodeIdentifier,
    List<_i2.CollectDataTemperature>? data,
  }) {
    return CollectData(
      nodeIdentifier: nodeIdentifier ?? this.nodeIdentifier,
      data: data ?? this.data.map((e0) => e0.copyWith()).toList(),
    );
  }
}
