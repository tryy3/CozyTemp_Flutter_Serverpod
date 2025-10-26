/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../temperature/models/sensor.dart' as _i2;

/// A node is a physical device that can be used to measure temperature.
abstract class Node
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
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

  static final t = NodeTable();

  static const db = NodeRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id?.toJson(),
      if (sensors != null)
        'sensors': sensors?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'identifier': identifier,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      'updatedAt': updatedAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static NodeInclude include({_i2.SensorIncludeList? sensors}) {
    return NodeInclude._(sensors: sensors);
  }

  static NodeIncludeList includeList({
    _i1.WhereExpressionBuilder<NodeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NodeTable>? orderByList,
    NodeInclude? include,
  }) {
    return NodeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Node.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Node.t),
      include: include,
    );
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

class NodeTable extends _i1.Table<_i1.UuidValue?> {
  NodeTable({super.tableRelation}) : super(tableName: 'nodes') {
    identifier = _i1.ColumnString(
      'identifier',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  _i2.SensorTable? ___sensors;

  _i1.ManyRelation<_i2.SensorTable>? _sensors;

  /// The unique identifier of the node, set by the device
  late final _i1.ColumnString identifier;

  /// The unique identifier of the node, set by the device
  late final _i1.ColumnString name;

  /// The unique identifier of the node, set by the device
  late final _i1.ColumnString description;

  /// The unique identifier of the node, set by the device
  late final _i1.ColumnDateTime updatedAt;

  /// The unique identifier of the node, set by the device
  late final _i1.ColumnDateTime createdAt;

  _i2.SensorTable get __sensors {
    if (___sensors != null) return ___sensors!;
    ___sensors = _i1.createRelationTable(
      relationFieldName: '__sensors',
      field: Node.t.id,
      foreignField: _i2.Sensor.t.parentNodeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SensorTable(tableRelation: foreignTableRelation),
    );
    return ___sensors!;
  }

  _i1.ManyRelation<_i2.SensorTable> get sensors {
    if (_sensors != null) return _sensors!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'sensors',
      field: Node.t.id,
      foreignField: _i2.Sensor.t.parentNodeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SensorTable(tableRelation: foreignTableRelation),
    );
    _sensors = _i1.ManyRelation<_i2.SensorTable>(
      tableWithRelations: relationTable,
      table: _i2.SensorTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _sensors!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        identifier,
        name,
        description,
        updatedAt,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'sensors') {
      return __sensors;
    }
    return null;
  }
}

class NodeInclude extends _i1.IncludeObject {
  NodeInclude._({_i2.SensorIncludeList? sensors}) {
    _sensors = sensors;
  }

  _i2.SensorIncludeList? _sensors;

  @override
  Map<String, _i1.Include?> get includes => {'sensors': _sensors};

  @override
  _i1.Table<_i1.UuidValue?> get table => Node.t;
}

class NodeIncludeList extends _i1.IncludeList {
  NodeIncludeList._({
    _i1.WhereExpressionBuilder<NodeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Node.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Node.t;
}

class NodeRepository {
  const NodeRepository._();

  final attach = const NodeAttachRepository._();

  final attachRow = const NodeAttachRowRepository._();

  final detach = const NodeDetachRepository._();

  final detachRow = const NodeDetachRowRepository._();

  /// Returns a list of [Node]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Node>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NodeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NodeTable>? orderByList,
    _i1.Transaction? transaction,
    NodeInclude? include,
  }) async {
    return session.db.find<Node>(
      where: where?.call(Node.t),
      orderBy: orderBy?.call(Node.t),
      orderByList: orderByList?.call(Node.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Node] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Node?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NodeTable>? where,
    int? offset,
    _i1.OrderByBuilder<NodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NodeTable>? orderByList,
    _i1.Transaction? transaction,
    NodeInclude? include,
  }) async {
    return session.db.findFirstRow<Node>(
      where: where?.call(Node.t),
      orderBy: orderBy?.call(Node.t),
      orderByList: orderByList?.call(Node.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Node] by its [id] or null if no such row exists.
  Future<Node?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    NodeInclude? include,
  }) async {
    return session.db.findById<Node>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Node]s in the list and returns the inserted rows.
  ///
  /// The returned [Node]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Node>> insert(
    _i1.Session session,
    List<Node> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Node>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Node] and returns the inserted row.
  ///
  /// The returned [Node] will have its `id` field set.
  Future<Node> insertRow(
    _i1.Session session,
    Node row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Node>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Node]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Node>> update(
    _i1.Session session,
    List<Node> rows, {
    _i1.ColumnSelections<NodeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Node>(
      rows,
      columns: columns?.call(Node.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Node]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Node> updateRow(
    _i1.Session session,
    Node row, {
    _i1.ColumnSelections<NodeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Node>(
      row,
      columns: columns?.call(Node.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Node]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Node>> delete(
    _i1.Session session,
    List<Node> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Node>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Node].
  Future<Node> deleteRow(
    _i1.Session session,
    Node row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Node>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Node>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NodeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Node>(
      where: where(Node.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NodeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Node>(
      where: where?.call(Node.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class NodeAttachRepository {
  const NodeAttachRepository._();

  /// Creates a relation between this [Node] and the given [Sensor]s
  /// by setting each [Sensor]'s foreign key `parentNodeId` to refer to this [Node].
  Future<void> sensors(
    _i1.Session session,
    Node node,
    List<_i2.Sensor> sensor, {
    _i1.Transaction? transaction,
  }) async {
    if (sensor.any((e) => e.id == null)) {
      throw ArgumentError.notNull('sensor.id');
    }
    if (node.id == null) {
      throw ArgumentError.notNull('node.id');
    }

    var $sensor = sensor.map((e) => e.copyWith(parentNodeId: node.id)).toList();
    await session.db.update<_i2.Sensor>(
      $sensor,
      columns: [_i2.Sensor.t.parentNodeId],
      transaction: transaction,
    );
  }
}

class NodeAttachRowRepository {
  const NodeAttachRowRepository._();

  /// Creates a relation between this [Node] and the given [Sensor]
  /// by setting the [Sensor]'s foreign key `parentNodeId` to refer to this [Node].
  Future<void> sensors(
    _i1.Session session,
    Node node,
    _i2.Sensor sensor, {
    _i1.Transaction? transaction,
  }) async {
    if (sensor.id == null) {
      throw ArgumentError.notNull('sensor.id');
    }
    if (node.id == null) {
      throw ArgumentError.notNull('node.id');
    }

    var $sensor = sensor.copyWith(parentNodeId: node.id);
    await session.db.updateRow<_i2.Sensor>(
      $sensor,
      columns: [_i2.Sensor.t.parentNodeId],
      transaction: transaction,
    );
  }
}

class NodeDetachRepository {
  const NodeDetachRepository._();

  /// Detaches the relation between this [Node] and the given [Sensor]
  /// by setting the [Sensor]'s foreign key `parentNodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> sensors(
    _i1.Session session,
    List<_i2.Sensor> sensor, {
    _i1.Transaction? transaction,
  }) async {
    if (sensor.any((e) => e.id == null)) {
      throw ArgumentError.notNull('sensor.id');
    }

    var $sensor = sensor.map((e) => e.copyWith(parentNodeId: null)).toList();
    await session.db.update<_i2.Sensor>(
      $sensor,
      columns: [_i2.Sensor.t.parentNodeId],
      transaction: transaction,
    );
  }
}

class NodeDetachRowRepository {
  const NodeDetachRowRepository._();

  /// Detaches the relation between this [Node] and the given [Sensor]
  /// by setting the [Sensor]'s foreign key `parentNodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> sensors(
    _i1.Session session,
    _i2.Sensor sensor, {
    _i1.Transaction? transaction,
  }) async {
    if (sensor.id == null) {
      throw ArgumentError.notNull('sensor.id');
    }

    var $sensor = sensor.copyWith(parentNodeId: null);
    await session.db.updateRow<_i2.Sensor>(
      $sensor,
      columns: [_i2.Sensor.t.parentNodeId],
      transaction: transaction,
    );
  }
}
