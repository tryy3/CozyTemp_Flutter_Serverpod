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
import '../../temperature/models/raw_data.dart' as _i2;

/// Calibrated temperature data adjusted from raw sensor readings
abstract class CalibratedTemperature
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  CalibratedTemperature._({
    this.id,
    this.rawDataId,
    this.rawData,
    required this.temperature,
    DateTime? calibratedAt,
  }) : calibratedAt = calibratedAt ?? DateTime.now();

  factory CalibratedTemperature({
    _i1.UuidValue? id,
    _i1.UuidValue? rawDataId,
    _i2.RawData? rawData,
    required double temperature,
    DateTime? calibratedAt,
  }) = _CalibratedTemperatureImpl;

  factory CalibratedTemperature.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CalibratedTemperature(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      rawDataId: jsonSerialization['rawDataId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['rawDataId']),
      rawData: jsonSerialization['rawData'] == null
          ? null
          : _i2.RawData.fromJson(
              (jsonSerialization['rawData'] as Map<String, dynamic>),
            ),
      temperature: (jsonSerialization['temperature'] as num).toDouble(),
      calibratedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['calibratedAt'],
      ),
    );
  }

  static final t = CalibratedTemperatureTable();

  static const db = CalibratedTemperatureRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue? rawDataId;

  _i2.RawData? rawData;

  double temperature;

  DateTime calibratedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [CalibratedTemperature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CalibratedTemperature copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? rawDataId,
    _i2.RawData? rawData,
    double? temperature,
    DateTime? calibratedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      if (rawDataId != null) 'rawDataId': rawDataId?.toJson(),
      if (rawData != null) 'rawData': rawData?.toJson(),
      'temperature': temperature,
      'calibratedAt': calibratedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id?.toJson(),
      if (rawDataId != null) 'rawDataId': rawDataId?.toJson(),
      if (rawData != null) 'rawData': rawData?.toJsonForProtocol(),
      'temperature': temperature,
      'calibratedAt': calibratedAt.toJson(),
    };
  }

  static CalibratedTemperatureInclude include({_i2.RawDataInclude? rawData}) {
    return CalibratedTemperatureInclude._(rawData: rawData);
  }

  static CalibratedTemperatureIncludeList includeList({
    _i1.WhereExpressionBuilder<CalibratedTemperatureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CalibratedTemperatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CalibratedTemperatureTable>? orderByList,
    CalibratedTemperatureInclude? include,
  }) {
    return CalibratedTemperatureIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CalibratedTemperature.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CalibratedTemperature.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CalibratedTemperatureImpl extends CalibratedTemperature {
  _CalibratedTemperatureImpl({
    _i1.UuidValue? id,
    _i1.UuidValue? rawDataId,
    _i2.RawData? rawData,
    required double temperature,
    DateTime? calibratedAt,
  }) : super._(
         id: id,
         rawDataId: rawDataId,
         rawData: rawData,
         temperature: temperature,
         calibratedAt: calibratedAt,
       );

  /// Returns a shallow copy of this [CalibratedTemperature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CalibratedTemperature copyWith({
    Object? id = _Undefined,
    Object? rawDataId = _Undefined,
    Object? rawData = _Undefined,
    double? temperature,
    DateTime? calibratedAt,
  }) {
    return CalibratedTemperature(
      id: id is _i1.UuidValue? ? id : this.id,
      rawDataId: rawDataId is _i1.UuidValue? ? rawDataId : this.rawDataId,
      rawData: rawData is _i2.RawData? ? rawData : this.rawData?.copyWith(),
      temperature: temperature ?? this.temperature,
      calibratedAt: calibratedAt ?? this.calibratedAt,
    );
  }
}

class CalibratedTemperatureUpdateTable
    extends _i1.UpdateTable<CalibratedTemperatureTable> {
  CalibratedTemperatureUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> rawDataId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.rawDataId,
    value,
  );

  _i1.ColumnValue<double, double> temperature(double value) => _i1.ColumnValue(
    table.temperature,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> calibratedAt(DateTime value) =>
      _i1.ColumnValue(
        table.calibratedAt,
        value,
      );
}

class CalibratedTemperatureTable extends _i1.Table<_i1.UuidValue?> {
  CalibratedTemperatureTable({super.tableRelation})
    : super(tableName: 'calibrated_temperature') {
    updateTable = CalibratedTemperatureUpdateTable(this);
    rawDataId = _i1.ColumnUuid(
      'rawDataId',
      this,
    );
    temperature = _i1.ColumnDouble(
      'temperature',
      this,
    );
    calibratedAt = _i1.ColumnDateTime(
      'calibratedAt',
      this,
      hasDefault: true,
    );
  }

  late final CalibratedTemperatureUpdateTable updateTable;

  late final _i1.ColumnUuid rawDataId;

  _i2.RawDataTable? _rawData;

  late final _i1.ColumnDouble temperature;

  late final _i1.ColumnDateTime calibratedAt;

  _i2.RawDataTable get rawData {
    if (_rawData != null) return _rawData!;
    _rawData = _i1.createRelationTable(
      relationFieldName: 'rawData',
      field: CalibratedTemperature.t.rawDataId,
      foreignField: _i2.RawData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RawDataTable(tableRelation: foreignTableRelation),
    );
    return _rawData!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    rawDataId,
    temperature,
    calibratedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'rawData') {
      return rawData;
    }
    return null;
  }
}

class CalibratedTemperatureInclude extends _i1.IncludeObject {
  CalibratedTemperatureInclude._({_i2.RawDataInclude? rawData}) {
    _rawData = rawData;
  }

  _i2.RawDataInclude? _rawData;

  @override
  Map<String, _i1.Include?> get includes => {'rawData': _rawData};

  @override
  _i1.Table<_i1.UuidValue?> get table => CalibratedTemperature.t;
}

class CalibratedTemperatureIncludeList extends _i1.IncludeList {
  CalibratedTemperatureIncludeList._({
    _i1.WhereExpressionBuilder<CalibratedTemperatureTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CalibratedTemperature.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => CalibratedTemperature.t;
}

class CalibratedTemperatureRepository {
  const CalibratedTemperatureRepository._();

  final attachRow = const CalibratedTemperatureAttachRowRepository._();

  final detachRow = const CalibratedTemperatureDetachRowRepository._();

  /// Returns a list of [CalibratedTemperature]s matching the given query parameters.
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
  Future<List<CalibratedTemperature>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CalibratedTemperatureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CalibratedTemperatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CalibratedTemperatureTable>? orderByList,
    _i1.Transaction? transaction,
    CalibratedTemperatureInclude? include,
  }) async {
    return session.db.find<CalibratedTemperature>(
      where: where?.call(CalibratedTemperature.t),
      orderBy: orderBy?.call(CalibratedTemperature.t),
      orderByList: orderByList?.call(CalibratedTemperature.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CalibratedTemperature] matching the given query parameters.
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
  Future<CalibratedTemperature?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CalibratedTemperatureTable>? where,
    int? offset,
    _i1.OrderByBuilder<CalibratedTemperatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CalibratedTemperatureTable>? orderByList,
    _i1.Transaction? transaction,
    CalibratedTemperatureInclude? include,
  }) async {
    return session.db.findFirstRow<CalibratedTemperature>(
      where: where?.call(CalibratedTemperature.t),
      orderBy: orderBy?.call(CalibratedTemperature.t),
      orderByList: orderByList?.call(CalibratedTemperature.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CalibratedTemperature] by its [id] or null if no such row exists.
  Future<CalibratedTemperature?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    CalibratedTemperatureInclude? include,
  }) async {
    return session.db.findById<CalibratedTemperature>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CalibratedTemperature]s in the list and returns the inserted rows.
  ///
  /// The returned [CalibratedTemperature]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CalibratedTemperature>> insert(
    _i1.Session session,
    List<CalibratedTemperature> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CalibratedTemperature>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CalibratedTemperature] and returns the inserted row.
  ///
  /// The returned [CalibratedTemperature] will have its `id` field set.
  Future<CalibratedTemperature> insertRow(
    _i1.Session session,
    CalibratedTemperature row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CalibratedTemperature>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CalibratedTemperature]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CalibratedTemperature>> update(
    _i1.Session session,
    List<CalibratedTemperature> rows, {
    _i1.ColumnSelections<CalibratedTemperatureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CalibratedTemperature>(
      rows,
      columns: columns?.call(CalibratedTemperature.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CalibratedTemperature]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CalibratedTemperature> updateRow(
    _i1.Session session,
    CalibratedTemperature row, {
    _i1.ColumnSelections<CalibratedTemperatureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CalibratedTemperature>(
      row,
      columns: columns?.call(CalibratedTemperature.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CalibratedTemperature] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CalibratedTemperature?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CalibratedTemperatureUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CalibratedTemperature>(
      id,
      columnValues: columnValues(CalibratedTemperature.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CalibratedTemperature]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CalibratedTemperature>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CalibratedTemperatureUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CalibratedTemperatureTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CalibratedTemperatureTable>? orderBy,
    _i1.OrderByListBuilder<CalibratedTemperatureTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CalibratedTemperature>(
      columnValues: columnValues(CalibratedTemperature.t.updateTable),
      where: where(CalibratedTemperature.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CalibratedTemperature.t),
      orderByList: orderByList?.call(CalibratedTemperature.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CalibratedTemperature]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CalibratedTemperature>> delete(
    _i1.Session session,
    List<CalibratedTemperature> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CalibratedTemperature>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CalibratedTemperature].
  Future<CalibratedTemperature> deleteRow(
    _i1.Session session,
    CalibratedTemperature row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CalibratedTemperature>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CalibratedTemperature>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CalibratedTemperatureTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CalibratedTemperature>(
      where: where(CalibratedTemperature.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CalibratedTemperatureTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CalibratedTemperature>(
      where: where?.call(CalibratedTemperature.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CalibratedTemperatureAttachRowRepository {
  const CalibratedTemperatureAttachRowRepository._();

  /// Creates a relation between the given [CalibratedTemperature] and [RawData]
  /// by setting the [CalibratedTemperature]'s foreign key `rawDataId` to refer to the [RawData].
  Future<void> rawData(
    _i1.Session session,
    CalibratedTemperature calibratedTemperature,
    _i2.RawData rawData, {
    _i1.Transaction? transaction,
  }) async {
    if (calibratedTemperature.id == null) {
      throw ArgumentError.notNull('calibratedTemperature.id');
    }
    if (rawData.id == null) {
      throw ArgumentError.notNull('rawData.id');
    }

    var $calibratedTemperature = calibratedTemperature.copyWith(
      rawDataId: rawData.id,
    );
    await session.db.updateRow<CalibratedTemperature>(
      $calibratedTemperature,
      columns: [CalibratedTemperature.t.rawDataId],
      transaction: transaction,
    );
  }
}

class CalibratedTemperatureDetachRowRepository {
  const CalibratedTemperatureDetachRowRepository._();

  /// Detaches the relation between this [CalibratedTemperature] and the [RawData] set in `rawData`
  /// by setting the [CalibratedTemperature]'s foreign key `rawDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> rawData(
    _i1.Session session,
    CalibratedTemperature calibratedTemperature, {
    _i1.Transaction? transaction,
  }) async {
    if (calibratedTemperature.id == null) {
      throw ArgumentError.notNull('calibratedTemperature.id');
    }

    var $calibratedTemperature = calibratedTemperature.copyWith(
      rawDataId: null,
    );
    await session.db.updateRow<CalibratedTemperature>(
      $calibratedTemperature,
      columns: [CalibratedTemperature.t.rawDataId],
      transaction: transaction,
    );
  }
}
