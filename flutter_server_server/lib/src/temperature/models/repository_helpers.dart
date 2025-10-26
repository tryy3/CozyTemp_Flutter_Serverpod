import 'package:serverpod/serverpod.dart';
import 'package:flutter_server_server/src/generated/protocol.dart';

/// Shared logic for findOrCreate pattern
class RepositoryHelpers {
  static Future<T> findOrCreate<T>({
    required Future<T?> Function() finder,
    required Future<T> Function() creator,
  }) async {
    var result = await finder();
    if (result == null) {
      return await creator();
    }
    return result;
  }
}

// Node extension
extension NodeRepositoryExtensions on NodeRepository {
  Future<Node> findOrCreate(
    Session session,
    Node toCreate, {
    WhereExpressionBuilder<NodeTable>? where,
    int? offset,
    OrderByBuilder<NodeTable>? orderBy,
    bool orderDescending = false,
    OrderByListBuilder<NodeTable>? orderByList,
    Transaction? transaction,
    NodeInclude? include,
  }) async {
    return RepositoryHelpers.findOrCreate(
      finder: () => findFirstRow(
        session,
        where: where,
        offset: offset,
        orderBy: orderBy,
        orderByList: orderByList,
        orderDescending: orderDescending,
        transaction: transaction,
        include: include,
      ),
      creator: () => insertRow(session, toCreate, transaction: transaction),
    );
  }
}

// Sensor extension (same pattern)
extension SensorRepositoryExtensions on SensorRepository {
  Future<Sensor> findOrCreate(
    Session session,
    Sensor toCreate, {
    WhereExpressionBuilder<SensorTable>? where,
    int? offset,
    OrderByBuilder<SensorTable>? orderBy,
    bool orderDescending = false,
    OrderByListBuilder<SensorTable>? orderByList,
    Transaction? transaction,
    SensorInclude? include,
  }) async {
    return RepositoryHelpers.findOrCreate(
      finder: () => findFirstRow(
        session,
        where: where,
        offset: offset,
        orderBy: orderBy,
        orderByList: orderByList,
        orderDescending: orderDescending,
        transaction: transaction,
        include: include,
      ),
      creator: () => insertRow(session, toCreate, transaction: transaction),
    );
  }
}
