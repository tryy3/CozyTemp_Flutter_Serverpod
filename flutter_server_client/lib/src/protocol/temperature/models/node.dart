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
import '../../temperature/models/sensor.dart' as _i2;

/// A node is a physical device that can be used to measure temperature.
abstract class Node implements _i1.SerializableModel {
  Node._({
    this.id,
    this.sensors,
    required this.identifier,
    this.name,
    this.description,
    DateTime? updatedAt,
    DateTime? createdAt,
  })  : updatedAt = updatedAt ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

  factory Node({
    _i1.UuidValue? id,
    List<_i2.Sensor>? sensors,
    required String identifier,
    String? name,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _NodeImpl;

  factory Node.fromJson(Map<String, dynamic> jsonSerialization) {
    return Node(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      sensors: (jsonSerialization['sensors'] as List?)
          ?.map((e) => _i2.Sensor.fromJson((e as Map<String, dynamic>)))
          .toList(),
      identifier: jsonSerialization['identifier'] as String,
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  List<_i2.Sensor>? sensors;

  /// The unique identifier of the node, set by the device
  String identifier;

  /// The unique identifier of the node, set by the device
  String? name;

  /// The unique identifier of the node, set by the device
  String? description;

  /// The unique identifier of the node, set by the device
  DateTime updatedAt;

  /// The unique identifier of the node, set by the device
  DateTime createdAt;

  /// Returns a shallow copy of this [Node]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Node copyWith({
    _i1.UuidValue? id,
    List<_i2.Sensor>? sensors,
    String? identifier,
    String? name,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      if (sensors != null)
        'sensors': sensors?.toJson(valueToJson: (v) => v.toJson()),
      'identifier': identifier,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      'updatedAt': updatedAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NodeImpl extends Node {
  _NodeImpl({
    _i1.UuidValue? id,
    List<_i2.Sensor>? sensors,
    required String identifier,
    String? name,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) : super._(
          id: id,
          sensors: sensors,
          identifier: identifier,
          name: name,
          description: description,
          updatedAt: updatedAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Node]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Node copyWith({
    Object? id = _Undefined,
    Object? sensors = _Undefined,
    String? identifier,
    Object? name = _Undefined,
    Object? description = _Undefined,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Node(
      id: id is _i1.UuidValue? ? id : this.id,
      sensors: sensors is List<_i2.Sensor>?
          ? sensors
          : this.sensors?.map((e0) => e0.copyWith()).toList(),
      identifier: identifier ?? this.identifier,
      name: name is String? ? name : this.name,
      description: description is String? ? description : this.description,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
