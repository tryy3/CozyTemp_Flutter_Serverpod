/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../temperature/models/node.dart' as _i2;
import '../../temperature/models/raw_data.dart' as _i3;

/// A sensor is the physical component that measures temperature.
abstract class Sensor
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
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
  }) : updatedAt = updatedAt ?? DateTime.now(),
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
        jsonSerialization['parentNodeId'],
      ),
      parentNode: jsonSerialization['parentNode'] == null
          ? null
          : _i2.Node.fromJson(
              (jsonSerialization['parentNode'] as Map<String, dynamic>),
            ),
      rawDataList: (jsonSerialization['rawDataList'] as List?)
          ?.map((e) => _i3.RawData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      identifier: jsonSerialization['identifier'] as String,
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SensorTable();

  static const db = SensorRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id?.toJson(),
      'parentNodeId': parentNodeId.toJson(),
      if (parentNode != null) 'parentNode': parentNode?.toJsonForProtocol(),
      if (rawDataList != null)
        'rawDataList': rawDataList?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'identifier': identifier,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      'updatedAt': updatedAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static SensorInclude include({
    _i2.NodeInclude? parentNode,
    _i3.RawDataIncludeList? rawDataList,
  }) {
    return SensorInclude._(
      parentNode: parentNode,
      rawDataList: rawDataList,
    );
  }

  static SensorIncludeList includeList({
    _i1.WhereExpressionBuilder<SensorTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SensorTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SensorTable>? orderByList,
    SensorInclude? include,
  }) {
    return SensorIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sensor.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Sensor.t),
      include: include,
    );
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
      parentNode: parentNode is _i2.Node?
          ? parentNode
          : this.parentNode?.copyWith(),
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

class SensorUpdateTable extends _i1.UpdateTable<SensorTable> {
  SensorUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> parentNodeId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.parentNodeId,
    value,
  );

  _i1.ColumnValue<String, String> identifier(String value) => _i1.ColumnValue(
    table.identifier,
    value,
  );

  _i1.ColumnValue<String, String> name(String? value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class SensorTable extends _i1.Table<_i1.UuidValue?> {
  SensorTable({super.tableRelation}) : super(tableName: 'sensors') {
    updateTable = SensorUpdateTable(this);
    parentNodeId = _i1.ColumnUuid(
      'parentNodeId',
      this,
    );
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

  late final SensorUpdateTable updateTable;

  late final _i1.ColumnUuid parentNodeId;

  _i2.NodeTable? _parentNode;

  _i3.RawDataTable? ___rawDataList;

  _i1.ManyRelation<_i3.RawDataTable>? _rawDataList;

  /// The unique identifier of the sensor, set by the device
  late final _i1.ColumnString identifier;

  /// The unique identifier of the sensor, set by the device
  late final _i1.ColumnString name;

  /// The unique identifier of the sensor, set by the device
  late final _i1.ColumnString description;

  /// The unique identifier of the sensor, set by the device
  late final _i1.ColumnDateTime updatedAt;

  /// The unique identifier of the sensor, set by the device
  late final _i1.ColumnDateTime createdAt;

  _i2.NodeTable get parentNode {
    if (_parentNode != null) return _parentNode!;
    _parentNode = _i1.createRelationTable(
      relationFieldName: 'parentNode',
      field: Sensor.t.parentNodeId,
      foreignField: _i2.Node.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.NodeTable(tableRelation: foreignTableRelation),
    );
    return _parentNode!;
  }

  _i3.RawDataTable get __rawDataList {
    if (___rawDataList != null) return ___rawDataList!;
    ___rawDataList = _i1.createRelationTable(
      relationFieldName: '__rawDataList',
      field: Sensor.t.id,
      foreignField: _i3.RawData.t.sensorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RawDataTable(tableRelation: foreignTableRelation),
    );
    return ___rawDataList!;
  }

  _i1.ManyRelation<_i3.RawDataTable> get rawDataList {
    if (_rawDataList != null) return _rawDataList!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'rawDataList',
      field: Sensor.t.id,
      foreignField: _i3.RawData.t.sensorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RawDataTable(tableRelation: foreignTableRelation),
    );
    _rawDataList = _i1.ManyRelation<_i3.RawDataTable>(
      tableWithRelations: relationTable,
      table: _i3.RawDataTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _rawDataList!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    parentNodeId,
    identifier,
    name,
    description,
    updatedAt,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'parentNode') {
      return parentNode;
    }
    if (relationField == 'rawDataList') {
      return __rawDataList;
    }
    return null;
  }
}

class SensorInclude extends _i1.IncludeObject {
  SensorInclude._({
    _i2.NodeInclude? parentNode,
    _i3.RawDataIncludeList? rawDataList,
  }) {
    _parentNode = parentNode;
    _rawDataList = rawDataList;
  }

  _i2.NodeInclude? _parentNode;

  _i3.RawDataIncludeList? _rawDataList;

  @override
  Map<String, _i1.Include?> get includes => {
    'parentNode': _parentNode,
    'rawDataList': _rawDataList,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => Sensor.t;
}

class SensorIncludeList extends _i1.IncludeList {
  SensorIncludeList._({
    _i1.WhereExpressionBuilder<SensorTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Sensor.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Sensor.t;
}

class SensorRepository {
  const SensorRepository._();

  final attach = const SensorAttachRepository._();

  final attachRow = const SensorAttachRowRepository._();

  /// Returns a list of [Sensor]s matching the given query parameters.
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
  Future<List<Sensor>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SensorTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SensorTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SensorTable>? orderByList,
    _i1.Transaction? transaction,
    SensorInclude? include,
  }) async {
    return session.db.find<Sensor>(
      where: where?.call(Sensor.t),
      orderBy: orderBy?.call(Sensor.t),
      orderByList: orderByList?.call(Sensor.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Sensor] matching the given query parameters.
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
  Future<Sensor?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SensorTable>? where,
    int? offset,
    _i1.OrderByBuilder<SensorTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SensorTable>? orderByList,
    _i1.Transaction? transaction,
    SensorInclude? include,
  }) async {
    return session.db.findFirstRow<Sensor>(
      where: where?.call(Sensor.t),
      orderBy: orderBy?.call(Sensor.t),
      orderByList: orderByList?.call(Sensor.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Sensor] by its [id] or null if no such row exists.
  Future<Sensor?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    SensorInclude? include,
  }) async {
    return session.db.findById<Sensor>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Sensor]s in the list and returns the inserted rows.
  ///
  /// The returned [Sensor]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Sensor>> insert(
    _i1.Session session,
    List<Sensor> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Sensor>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Sensor] and returns the inserted row.
  ///
  /// The returned [Sensor] will have its `id` field set.
  Future<Sensor> insertRow(
    _i1.Session session,
    Sensor row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Sensor>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Sensor]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Sensor>> update(
    _i1.Session session,
    List<Sensor> rows, {
    _i1.ColumnSelections<SensorTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Sensor>(
      rows,
      columns: columns?.call(Sensor.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Sensor]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Sensor> updateRow(
    _i1.Session session,
    Sensor row, {
    _i1.ColumnSelections<SensorTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Sensor>(
      row,
      columns: columns?.call(Sensor.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Sensor] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Sensor?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<SensorUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Sensor>(
      id,
      columnValues: columnValues(Sensor.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Sensor]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Sensor>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<SensorUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SensorTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SensorTable>? orderBy,
    _i1.OrderByListBuilder<SensorTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Sensor>(
      columnValues: columnValues(Sensor.t.updateTable),
      where: where(Sensor.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sensor.t),
      orderByList: orderByList?.call(Sensor.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Sensor]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Sensor>> delete(
    _i1.Session session,
    List<Sensor> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Sensor>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Sensor].
  Future<Sensor> deleteRow(
    _i1.Session session,
    Sensor row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Sensor>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Sensor>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SensorTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Sensor>(
      where: where(Sensor.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SensorTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Sensor>(
      where: where?.call(Sensor.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SensorAttachRepository {
  const SensorAttachRepository._();

  /// Creates a relation between this [Sensor] and the given [RawData]s
  /// by setting each [RawData]'s foreign key `sensorId` to refer to this [Sensor].
  Future<void> rawDataList(
    _i1.Session session,
    Sensor sensor,
    List<_i3.RawData> rawData, {
    _i1.Transaction? transaction,
  }) async {
    if (rawData.any((e) => e.id == null)) {
      throw ArgumentError.notNull('rawData.id');
    }
    if (sensor.id == null) {
      throw ArgumentError.notNull('sensor.id');
    }

    var $rawData = rawData.map((e) => e.copyWith(sensorId: sensor.id)).toList();
    await session.db.update<_i3.RawData>(
      $rawData,
      columns: [_i3.RawData.t.sensorId],
      transaction: transaction,
    );
  }
}

class SensorAttachRowRepository {
  const SensorAttachRowRepository._();

  /// Creates a relation between the given [Sensor] and [Node]
  /// by setting the [Sensor]'s foreign key `parentNodeId` to refer to the [Node].
  Future<void> parentNode(
    _i1.Session session,
    Sensor sensor,
    _i2.Node parentNode, {
    _i1.Transaction? transaction,
  }) async {
    if (sensor.id == null) {
      throw ArgumentError.notNull('sensor.id');
    }
    if (parentNode.id == null) {
      throw ArgumentError.notNull('parentNode.id');
    }

    var $sensor = sensor.copyWith(parentNodeId: parentNode.id);
    await session.db.updateRow<Sensor>(
      $sensor,
      columns: [Sensor.t.parentNodeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Sensor] and the given [RawData]
  /// by setting the [RawData]'s foreign key `sensorId` to refer to this [Sensor].
  Future<void> rawDataList(
    _i1.Session session,
    Sensor sensor,
    _i3.RawData rawData, {
    _i1.Transaction? transaction,
  }) async {
    if (rawData.id == null) {
      throw ArgumentError.notNull('rawData.id');
    }
    if (sensor.id == null) {
      throw ArgumentError.notNull('sensor.id');
    }

    var $rawData = rawData.copyWith(sensorId: sensor.id);
    await session.db.updateRow<_i3.RawData>(
      $rawData,
      columns: [_i3.RawData.t.sensorId],
      transaction: transaction,
    );
  }
}
