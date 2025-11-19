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

abstract class CollectDataTemperature implements _i1.SerializableModel {
  CollectDataTemperature._({
    required this.sensorIdentifier,
    required this.temperature,
  });

  factory CollectDataTemperature({
    required String sensorIdentifier,
    required double temperature,
  }) = _CollectDataTemperatureImpl;

  factory CollectDataTemperature.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CollectDataTemperature(
      sensorIdentifier: jsonSerialization['sensorIdentifier'] as String,
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
    );
  }

  String sensorIdentifier;

  double temperature;

  /// Returns a shallow copy of this [CollectDataTemperature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CollectDataTemperature copyWith({
    String? sensorIdentifier,
    double? temperature,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'sensorIdentifier': sensorIdentifier,
      'temperature': temperature,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CollectDataTemperatureImpl extends CollectDataTemperature {
  _CollectDataTemperatureImpl({
    required String sensorIdentifier,
    required double temperature,
  }) : super._(
         sensorIdentifier: sensorIdentifier,
         temperature: temperature,
       );

  /// Returns a shallow copy of this [CollectDataTemperature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CollectDataTemperature copyWith({
    String? sensorIdentifier,
    double? temperature,
  }) {
    return CollectDataTemperature(
      sensorIdentifier: sensorIdentifier ?? this.sensorIdentifier,
      temperature: temperature ?? this.temperature,
    );
  }
}
