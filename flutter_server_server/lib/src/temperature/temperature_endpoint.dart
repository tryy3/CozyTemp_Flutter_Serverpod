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
          where: (t) => t.identifier.equals(data.sensorIdentifier),
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

        var latestData = await RawData.db.findFirstRow(
          session,
          where: (t) => t.sensorId.equals(sensor.id!),
          orderBy: (t) => t.createdAt,
          orderDescending: true,
        );

        if (latestData != null) {
          session.log("Latest data, created at: ${latestData.createdAt}");
          // Now we can safely add to the sensor's rawDataList
          sensor.rawDataList!.add(latestData);
        } else {
          session.log("No data found for sensor ${sensor.identifier}");
        }
      }
    }

    return nodes;
  }
}
