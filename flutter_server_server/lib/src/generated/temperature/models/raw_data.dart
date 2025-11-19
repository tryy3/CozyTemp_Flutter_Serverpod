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
import '../../temperature/models/sensor.dart' as _i2;
import '../../temperature/models/calibrated_temperature.dart' as _i3;

/// A raw data is the raw temperature data from a sensor.
abstract class RawData
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  RawData._({
    this.id,
    required this.sensorId,
    this.sensor,
    this.calibration,
    required this.temperature,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory RawData({
    _i1.UuidValue? id,
    required _i1.UuidValue sensorId,
    _i2.Sensor? sensor,
    _i3.CalibratedTemperature? calibration,
    required double temperature,
    DateTime? createdAt,
  }) = _RawDataImpl;

  factory RawData.fromJson(Map<String, dynamic> jsonSerialization) {
    return RawData(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      sensorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['sensorId'],
      ),
      sensor: jsonSerialization['sensor'] == null
          ? null
          : _i2.Sensor.fromJson(
              (jsonSerialization['sensor'] as Map<String, dynamic>),
            ),
      calibration: jsonSerialization['calibration'] == null
          ? null
          : _i3.CalibratedTemperature.fromJson(
              (jsonSerialization['calibration'] as Map<String, dynamic>),
            ),
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = RawDataTable();

  static const db = RawDataRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue sensorId;

  _i2.Sensor? sensor;

  _i3.CalibratedTemperature? calibration;

  double temperature;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [RawData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RawData copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? sensorId,
    _i2.Sensor? sensor,
    _i3.CalibratedTemperature? calibration,
    double? temperature,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'sensorId': sensorId.toJson(),
      if (sensor != null) 'sensor': sensor?.toJson(),
      if (calibration != null) 'calibration': calibration?.toJson(),
      'temperature': temperature,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id?.toJson(),
      'sensorId': sensorId.toJson(),
      if (sensor != null) 'sensor': sensor?.toJsonForProtocol(),
      if (calibration != null) 'calibration': calibration?.toJsonForProtocol(),
      'temperature': temperature,
      'createdAt': createdAt.toJson(),
    };
  }

  static RawDataInclude include({
    _i2.SensorInclude? sensor,
    _i3.CalibratedTemperatureInclude? calibration,
  }) {
    return RawDataInclude._(
      sensor: sensor,
      calibration: calibration,
    );
  }

  static RawDataIncludeList includeList({
    _i1.WhereExpressionBuilder<RawDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RawDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RawDataTable>? orderByList,
    RawDataInclude? include,
  }) {
    return RawDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RawData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RawData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RawDataImpl extends RawData {
  _RawDataImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue sensorId,
    _i2.Sensor? sensor,
    _i3.CalibratedTemperature? calibration,
    required double temperature,
    DateTime? createdAt,
  }) : super._(
         id: id,
         sensorId: sensorId,
         sensor: sensor,
         calibration: calibration,
         temperature: temperature,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RawData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RawData copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? sensorId,
    Object? sensor = _Undefined,
    Object? calibration = _Undefined,
    double? temperature,
    DateTime? createdAt,
  }) {
    return RawData(
      id: id is _i1.UuidValue? ? id : this.id,
      sensorId: sensorId ?? this.sensorId,
      sensor: sensor is _i2.Sensor? ? sensor : this.sensor?.copyWith(),
      calibration: calibration is _i3.CalibratedTemperature?
          ? calibration
          : this.calibration?.copyWith(),
      temperature: temperature ?? this.temperature,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RawDataUpdateTable extends _i1.UpdateTable<RawDataTable> {
  RawDataUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> sensorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.sensorId,
        value,
      );

  _i1.ColumnValue<double, double> temperature(double value) => _i1.ColumnValue(
    table.temperature,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class RawDataTable extends _i1.Table<_i1.UuidValue?> {
  RawDataTable({super.tableRelation}) : super(tableName: 'raw_data') {
    updateTable = RawDataUpdateTable(this);
    sensorId = _i1.ColumnUuid(
      'sensorId',
      this,
    );
    temperature = _i1.ColumnDouble(
      'temperature',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final RawDataUpdateTable updateTable;

  late final _i1.ColumnUuid sensorId;

  _i2.SensorTable? _sensor;

  _i3.CalibratedTemperatureTable? _calibration;

  late final _i1.ColumnDouble temperature;

  late final _i1.ColumnDateTime createdAt;

  _i2.SensorTable get sensor {
    if (_sensor != null) return _sensor!;
    _sensor = _i1.createRelationTable(
      relationFieldName: 'sensor',
      field: RawData.t.sensorId,
      foreignField: _i2.Sensor.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SensorTable(tableRelation: foreignTableRelation),
    );
    return _sensor!;
  }

  _i3.CalibratedTemperatureTable get calibration {
    if (_calibration != null) return _calibration!;
    _calibration = _i1.createRelationTable(
      relationFieldName: 'calibration',
      field: RawData.t.id,
      foreignField: _i3.CalibratedTemperature.t.rawDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CalibratedTemperatureTable(tableRelation: foreignTableRelation),
    );
    return _calibration!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    sensorId,
    temperature,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'sensor') {
      return sensor;
    }
    if (relationField == 'calibration') {
      return calibration;
    }
    return null;
  }
}

class RawDataInclude extends _i1.IncludeObject {
  RawDataInclude._({
    _i2.SensorInclude? sensor,
    _i3.CalibratedTemperatureInclude? calibration,
  }) {
    _sensor = sensor;
    _calibration = calibration;
  }

  _i2.SensorInclude? _sensor;

  _i3.CalibratedTemperatureInclude? _calibration;

  @override
  Map<String, _i1.Include?> get includes => {
    'sensor': _sensor,
    'calibration': _calibration,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => RawData.t;
}

class RawDataIncludeList extends _i1.IncludeList {
  RawDataIncludeList._({
    _i1.WhereExpressionBuilder<RawDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RawData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => RawData.t;
}

class RawDataRepository {
  const RawDataRepository._();

  final attachRow = const RawDataAttachRowRepository._();

  final detachRow = const RawDataDetachRowRepository._();

  /// Returns a list of [RawData]s matching the given query parameters.
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
  Future<List<RawData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RawDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RawDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RawDataTable>? orderByList,
    _i1.Transaction? transaction,
    RawDataInclude? include,
  }) async {
    return session.db.find<RawData>(
      where: where?.call(RawData.t),
      orderBy: orderBy?.call(RawData.t),
      orderByList: orderByList?.call(RawData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [RawData] matching the given query parameters.
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
  Future<RawData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RawDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<RawDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RawDataTable>? orderByList,
    _i1.Transaction? transaction,
    RawDataInclude? include,
  }) async {
    return session.db.findFirstRow<RawData>(
      where: where?.call(RawData.t),
      orderBy: orderBy?.call(RawData.t),
      orderByList: orderByList?.call(RawData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [RawData] by its [id] or null if no such row exists.
  Future<RawData?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    RawDataInclude? include,
  }) async {
    return session.db.findById<RawData>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [RawData]s in the list and returns the inserted rows.
  ///
  /// The returned [RawData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RawData>> insert(
    _i1.Session session,
    List<RawData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RawData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RawData] and returns the inserted row.
  ///
  /// The returned [RawData] will have its `id` field set.
  Future<RawData> insertRow(
    _i1.Session session,
    RawData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RawData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RawData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RawData>> update(
    _i1.Session session,
    List<RawData> rows, {
    _i1.ColumnSelections<RawDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RawData>(
      rows,
      columns: columns?.call(RawData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RawData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RawData> updateRow(
    _i1.Session session,
    RawData row, {
    _i1.ColumnSelections<RawDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RawData>(
      row,
      columns: columns?.call(RawData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RawData] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RawData?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<RawDataUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RawData>(
      id,
      columnValues: columnValues(RawData.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RawData]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RawData>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<RawDataUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RawDataTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RawDataTable>? orderBy,
    _i1.OrderByListBuilder<RawDataTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RawData>(
      columnValues: columnValues(RawData.t.updateTable),
      where: where(RawData.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RawData.t),
      orderByList: orderByList?.call(RawData.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RawData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RawData>> delete(
    _i1.Session session,
    List<RawData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RawData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RawData].
  Future<RawData> deleteRow(
    _i1.Session session,
    RawData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RawData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RawData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RawDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RawData>(
      where: where(RawData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RawDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RawData>(
      where: where?.call(RawData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RawDataAttachRowRepository {
  const RawDataAttachRowRepository._();

  /// Creates a relation between the given [RawData] and [Sensor]
  /// by setting the [RawData]'s foreign key `sensorId` to refer to the [Sensor].
  Future<void> sensor(
    _i1.Session session,
    RawData rawData,
    _i2.Sensor sensor, {
    _i1.Transaction? transaction,
  }) async {
    if (rawData.id == null) {
      throw ArgumentError.notNull('rawData.id');
    }
    if (sensor.id == null) {
      throw ArgumentError.notNull('sensor.id');
    }

    var $rawData = rawData.copyWith(sensorId: sensor.id);
    await session.db.updateRow<RawData>(
      $rawData,
      columns: [RawData.t.sensorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [RawData] and [CalibratedTemperature]
  /// by setting the [RawData]'s foreign key `id` to refer to the [CalibratedTemperature].
  Future<void> calibration(
    _i1.Session session,
    RawData rawData,
    _i3.CalibratedTemperature calibration, {
    _i1.Transaction? transaction,
  }) async {
    if (calibration.id == null) {
      throw ArgumentError.notNull('calibration.id');
    }
    if (rawData.id == null) {
      throw ArgumentError.notNull('rawData.id');
    }

    var $calibration = calibration.copyWith(rawDataId: rawData.id);
    await session.db.updateRow<_i3.CalibratedTemperature>(
      $calibration,
      columns: [_i3.CalibratedTemperature.t.rawDataId],
      transaction: transaction,
    );
  }
}

class RawDataDetachRowRepository {
  const RawDataDetachRowRepository._();

  /// Detaches the relation between this [RawData] and the [CalibratedTemperature] set in `calibration`
  /// by setting the [RawData]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> calibration(
    _i1.Session session,
    RawData rawData, {
    _i1.Transaction? transaction,
  }) async {
    var $calibration = rawData.calibration;

    if ($calibration == null) {
      throw ArgumentError.notNull('rawData.calibration');
    }
    if ($calibration.id == null) {
      throw ArgumentError.notNull('rawData.calibration.id');
    }
    if (rawData.id == null) {
      throw ArgumentError.notNull('rawData.id');
    }

    var $$calibration = $calibration.copyWith(rawDataId: null);
    await session.db.updateRow<_i3.CalibratedTemperature>(
      $$calibration,
      columns: [_i3.CalibratedTemperature.t.rawDataId],
      transaction: transaction,
    );
  }
}
