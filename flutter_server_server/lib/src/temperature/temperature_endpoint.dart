import 'dart:async';

import 'package:flutter_server_server/src/generated/protocol.dart';
import 'package:flutter_server_server/src/temperature/models/repository_helpers.dart';
import 'package:serverpod/serverpod.dart';

class TemperatureEndpoint extends Endpoint {
  Future<String> getTemperatures(Session session, String ingredients) async {
    return 'Hello WOrld: $ingredients';
  }

  Future<void> collectData(Session session, CollectData collectData) async {
    // 1. Check if the node exists
    // 1.1 Get the node from the database
    // 1.2 If the node does not exist, create it
    // 2. Loop through each data point
    // 2.1 Check if the sensor exists
    // 2.1.1 Get the sensor from the database
    // 2.1.2 If the sensor does not exist, create it
    // 2.2 Create a new raw data entry for the sensor
    session.log("Temperature reading collection started");

    await session.db.transaction((transaction) async {
      var node = await Node.db.findOrCreate(
        session,
        Node(identifier: collectData.nodeIdentifier),
        where: (t) => t.identifier.equals(collectData.nodeIdentifier),
        transaction: transaction,
      );

      for (var data in collectData.data) {
        var sensor = await Sensor.db.findOrCreate(
          session,
          Sensor(identifier: data.sensorIdentifier, parentNodeId: node.id!),
          where: (t) =>
              t.identifier.equals(data.sensorIdentifier) &
              t.parentNodeId.equals(node.id),
          transaction: transaction,
        );

        await RawData.db.insertRow(
          session,
          RawData(sensorId: sensor.id!, temperature: data.temperature),
          transaction: transaction,
        );
      }
      session.log("Temperature reading collection completed");
    });
  }

  Future<List<Node>> latestTemperatureData(Session session) async {
    // var nodes = await Node.db.find(
    //   session,
    //   include: Node.include(
    //     sensors: Sensor.includeList(
    //       include: Sensor.include(
    //         rawDataList: RawData.includeList(
    //           limit: 1,
    //           orderBy: (t) => t.createdAt,
    //           orderDescending: true,
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    var nodes = await Node.db.find(
      session,
      include: Node.include(
        sensors: Sensor.includeList(
          include: Sensor.include(),
        ),
      ),
    );

    for (var node in nodes) {
      var sensors = node.sensors ?? [];
      for (var sensor in sensors) {
        // Initialize the list if it's null
        sensor.rawDataList ??= [];

        session.log(
            "Data points for sensor ${sensor.identifier}: ${sensor.rawDataList!.length}");

        // Fetch latest RawData that HAS calibration (only show calibrated data)
        var latestData = await RawData.db.findFirstRow(
          session,
          where: (t) =>
              t.sensorId.equals(sensor.id!) & t.calibration.id.notEquals(null),
          orderBy: (t) => t.createdAt,
          orderDescending: true,
          include: RawData.include(
            calibration: CalibratedTemperature.include(),
          ),
        );

        if (latestData != null && latestData.calibration != null) {
          session.log(
              "Latest calibrated data, created at: ${latestData.createdAt}");
          session
              .log("  - Calibration: ${latestData.calibration!.temperature}°C");
          // Now we can safely add to the sensor's rawDataList
          sensor.rawDataList!.add(latestData);
        } else {
          session
              .log("No calibrated data found for sensor ${sensor.identifier}");
        }
      }
    }

    return nodes;
  }

  /// Fetches historical temperature data for a specific node with aggregation
  /// [nodeId] - The UUID of the node to fetch data for
  /// [timeRange] - Time range filter: "24h", "7d", or "all"
  ///
  /// Data is aggregated into time buckets to optimize performance:
  /// - 24h: 5-minute intervals (~288 points per sensor)
  /// - 7d: 1-hour intervals (~168 points per sensor)
  /// - all: 1-day intervals
  Future<Node?> getNodeHistoricalData(
    Session session,
    String nodeId,
    String timeRange,
  ) async {
    session
        .log("Fetching historical data for node: $nodeId, range: $timeRange");

    // Parse the node ID
    UuidValue? nodeUuid;
    try {
      nodeUuid = UuidValue.fromString(nodeId);
    } catch (e) {
      session.log("Invalid node ID format: $nodeId");
      return null;
    }

    // Fetch the node with its sensors
    var node = await Node.db.findById(
      session,
      nodeUuid,
      include: Node.include(
        sensors: Sensor.includeList(
          include: Sensor.include(),
        ),
      ),
    );

    if (node == null) {
      session.log("Node not found: $nodeId");
      return null;
    }

    // Calculate the time threshold and bucket interval based on the range
    DateTime? timeThreshold;
    String bucketInterval;
    String bucketOrigin;

    if (timeRange == "24h") {
      timeThreshold = DateTime.now().subtract(const Duration(hours: 24));
      bucketInterval = '5 minutes'; // ~288 data points
      bucketOrigin = '2000-01-01 00:00:00'; // Arbitrary origin for alignment
    } else if (timeRange == "7d") {
      timeThreshold = DateTime.now().subtract(const Duration(days: 7));
      bucketInterval = '1 hour'; // ~168 data points
      bucketOrigin = '2000-01-01 00:00:00';
    } else {
      // For "all", use daily buckets and no time filter
      bucketInterval = '1 day';
      bucketOrigin = '2000-01-01 00:00:00';
    }

    // Fetch aggregated historical data for each sensor
    var sensors = node.sensors ?? [];
    for (var sensor in sensors) {
      sensor.rawDataList ??= [];

      // Build SQL query with time bucketing and aggregation
      // Using date_bin for PostgreSQL to group data into arbitrary time buckets
      String whereClause = timeThreshold != null
          ? "AND \"createdAt\" >= '${timeThreshold.toIso8601String()}'"
          : "";

      final sql = '''
        SELECT 
          date_bin('$bucketInterval', "createdAt", '$bucketOrigin') as bucket_time,
          AVG(temperature) as avg_temp
        FROM raw_data
        WHERE "sensorId" = '${sensor.id!.uuid}'
        $whereClause
        GROUP BY bucket_time
        ORDER BY bucket_time ASC
      ''';

      session
          .log("Executing aggregation query for sensor ${sensor.identifier}");

      final result = await session.db.unsafeQuery(sql);

      // Convert the aggregated results to RawData objects
      // We'll use the average temperature as the main value
      List<RawData> rawData = [];
      for (var row in result) {
        final bucketTime = row[0] as DateTime;
        final avgTemp = (row[1] as num).toDouble();

        rawData.add(RawData(
          sensorId: sensor.id!,
          temperature: avgTemp,
          createdAt: bucketTime,
        ));
      }

      sensor.rawDataList = rawData;
      session.log(
          "Fetched ${rawData.length} aggregated data points for sensor ${sensor.identifier} (reduced from potentially thousands)");
    }

    return node;
  }

  /// Updates a node's name and/or description
  /// Returns the updated node or null if not found
  Future<Node?> updateNode(
    Session session,
    String nodeId,
    String? name,
    String? description,
  ) async {
    session.log("Updating node: $nodeId");

    // Parse the node ID
    UuidValue? nodeUuid;
    try {
      nodeUuid = UuidValue.fromString(nodeId);
    } catch (e) {
      session.log("Invalid node ID format: $nodeId");
      return null;
    }

    // Fetch the existing node
    var node = await Node.db.findById(session, nodeUuid);
    if (node == null) {
      session.log("Node not found: $nodeId");
      return null;
    }

    // Update fields
    node.name = name;
    node.description = description;
    node.updatedAt = DateTime.now();

    // Save to database
    await Node.db.updateRow(session, node);

    session.log("Node updated successfully: $nodeId");
    return node;
  }

  /// Updates a sensor's name and/or description
  /// Returns the updated sensor or null if not found
  Future<Sensor?> updateSensor(
    Session session,
    String sensorId,
    String? name,
    String? description,
  ) async {
    session.log("Updating sensor: $sensorId");

    // Parse the sensor ID
    UuidValue? sensorUuid;
    try {
      sensorUuid = UuidValue.fromString(sensorId);
    } catch (e) {
      session.log("Invalid sensor ID format: $sensorId");
      return null;
    }

    // Fetch the existing sensor
    var sensor = await Sensor.db.findById(session, sensorUuid);
    if (sensor == null) {
      session.log("Sensor not found: $sensorId");
      return null;
    }

    // Update fields
    sensor.name = name;
    sensor.description = description;
    sensor.updatedAt = DateTime.now();

    // Save to database
    await Sensor.db.updateRow(session, sensor);

    session.log("Sensor updated successfully: $sensorId");
    return sensor;
  }

  /// Fetches uncalibrated raw temperature data
  /// [limit] - Maximum number of records to return
  /// Returns the newest uncalibrated data points first
  Future<List<RawData>> getUncalibratedData(
    Session session,
    int limit,
  ) async {
    session.log("Fetching uncalibrated data with limit: $limit");

    // Find RawData where calibration is null (LEFT JOIN where calibrated_temperature.id IS NULL)
    final rawData = await RawData.db.find(
      session,
      where: (t) => t.calibration.id.equals(null),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
    );

    session.log("Found ${rawData.length} uncalibrated data points");
    return rawData;
  }

  /// Creates calibrated temperature readings for multiple raw data points (bulk insert)
  /// [calibrations] - List of CalibrationInput containing rawDataId and temperature
  /// Returns true on success
  ///
  /// Uses Serverpod's built-in batch insert which is atomic (all-or-nothing).
  /// PostgreSQL constraints will enforce:
  /// - Foreign key constraint ensures rawDataId exists in raw_data table
  /// - Unique constraint on rawDataId prevents duplicate calibrations
  /// If any constraint is violated, the entire operation fails and an error is thrown
  Future<bool> createCalibratedTemperature(
    Session session,
    List<CalibrationInput> calibrations,
  ) async {
    session.log("Bulk creating ${calibrations.length} calibrated temperatures");

    if (calibrations.isEmpty) {
      session.log("No calibrations to create");
      return true;
    }

    // Parse UUIDs and build CalibratedTemperature objects
    final List<CalibratedTemperature> calibrationsToInsert = [];

    for (var i = 0; i < calibrations.length; i++) {
      try {
        final uuid = UuidValue.fromString(calibrations[i].rawDataId);
        calibrationsToInsert.add(CalibratedTemperature(
          rawDataId: uuid,
          temperature: calibrations[i].temperature,
        ));
      } catch (e) {
        session.log("Invalid UUID at index $i: ${calibrations[i].rawDataId}");
        throw Exception(
            "Invalid rawData ID format at index $i: ${calibrations[i].rawDataId}");
      }
    }

    // Use Serverpod's built-in batch insert - atomic operation
    await CalibratedTemperature.db.insert(session, calibrationsToInsert);
    session.log(
        "Successfully bulk inserted ${calibrationsToInsert.length} calibrations");

    return true;
  }
}
