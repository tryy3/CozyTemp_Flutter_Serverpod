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

/// Input data for creating a calibrated temperature reading
abstract class CalibrationInput
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CalibrationInput._({
    required this.rawDataId,
    required this.temperature,
  });

  factory CalibrationInput({
    required String rawDataId,
    required double temperature,
  }) = _CalibrationInputImpl;

  factory CalibrationInput.fromJson(Map<String, dynamic> jsonSerialization) {
    return CalibrationInput(
      rawDataId: jsonSerialization['rawDataId'] as String,
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
    );
  }

  String rawDataId;

  double temperature;

  /// Returns a shallow copy of this [CalibrationInput]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CalibrationInput copyWith({
    String? rawDataId,
    double? temperature,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'rawDataId': rawDataId,
      'temperature': temperature,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'rawDataId': rawDataId,
      'temperature': temperature,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CalibrationInputImpl extends CalibrationInput {
  _CalibrationInputImpl({
    required String rawDataId,
    required double temperature,
  }) : super._(
          rawDataId: rawDataId,
          temperature: temperature,
        );

  /// Returns a shallow copy of this [CalibrationInput]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CalibrationInput copyWith({
    String? rawDataId,
    double? temperature,
  }) {
    return CalibrationInput(
      rawDataId: rawDataId ?? this.rawDataId,
      temperature: temperature ?? this.temperature,
    );
  }
}
