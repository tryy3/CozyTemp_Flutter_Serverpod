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
import '../../temperature/models/node.dart' as _i2;
import '../../temperature/models/raw_data.dart' as _i3;

/// A sensor is the physical component that measures temperature.
abstract class Sensor implements _i1.SerializableModel {
  Sensor._({
    this.id,
    required this.parentNodeId,
    this.parentNode,
    this.rawDataList,
    required this.identifier,
    this.name,
    this.description,
    DateTime? updatedAt,
    DateTime? createdAt,
  })  : updatedAt = updatedAt ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

  factory Sensor({
    _i1.UuidValue? id,
    required _i1.UuidValue parentNodeId,
    _i2.Node? parentNode,
    List<_i3.RawData>? rawDataList,
    required String identifier,
    String? name,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _SensorImpl;

  factory Sensor.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sensor(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      parentNodeId: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['parentNodeId']),
      parentNode: jsonSerialization['parentNode'] == null
          ? null
          : _i2.Node.fromJson(
              (jsonSerialization['parentNode'] as Map<String, dynamic>)),
      rawDataList: (jsonSerialization['rawDataList'] as List?)
          ?.map((e) => _i3.RawData.fromJson((e as Map<String, dynamic>)))
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

  _i1.UuidValue parentNodeId;

  _i2.Node? parentNode;

  List<_i3.RawData>? rawDataList;

  /// The unique identifier of the sensor, set by the device
  String identifier;

  /// The unique identifier of the sensor, set by the device
  String? name;

  /// The unique identifier of the sensor, set by the device
  String? description;

  /// The unique identifier of the sensor, set by the device
  DateTime updatedAt;

  /// The unique identifier of the sensor, set by the device
  DateTime createdAt;

  /// Returns a shallow copy of this [Sensor]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sensor copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? parentNodeId,
    _i2.Node? parentNode,
    List<_i3.RawData>? rawDataList,
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
      'parentNodeId': parentNodeId.toJson(),
      if (parentNode != null) 'parentNode': parentNode?.toJson(),
      if (rawDataList != null)
        'rawDataList': rawDataList?.toJson(valueToJson: (v) => v.toJson()),
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

class _SensorImpl extends Sensor {
  _SensorImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue parentNodeId,
    _i2.Node? parentNode,
    List<_i3.RawData>? rawDataList,
    required String identifier,
    String? name,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) : super._(
          id: id,
          parentNodeId: parentNodeId,
          parentNode: parentNode,
          rawDataList: rawDataList,
          identifier: identifier,
          name: name,
          description: description,
          updatedAt: updatedAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Sensor]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sensor copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? parentNodeId,
    Object? parentNode = _Undefined,
    Object? rawDataList = _Undefined,
    String? identifier,
    Object? name = _Undefined,
    Object? description = _Undefined,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Sensor(
      id: id is _i1.UuidValue? ? id : this.id,
      parentNodeId: parentNodeId ?? this.parentNodeId,
      parentNode:
          parentNode is _i2.Node? ? parentNode : this.parentNode?.copyWith(),
      rawDataList: rawDataList is List<_i3.RawData>?
          ? rawDataList
          : this.rawDataList?.map((e0) => e0.copyWith()).toList(),
      identifier: identifier ?? this.identifier,
      name: name is String? ? name : this.name,
      description: description is String? ? description : this.description,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
