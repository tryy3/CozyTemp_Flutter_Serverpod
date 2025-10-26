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

    var node = await Node.db.findOrCreate(
        session, Node(identifier: collectData.nodeIdentifier),
        where: (t) => t.identifier.equals(collectData.nodeIdentifier));

    for (var data in collectData.data) {
      var sensor = await Sensor.db.findOrCreate(
        session,
        Sensor(identifier: data.sensorIdentifier, parentNodeId: node.id!),
        where: (t) => t.identifier.equals(data.sensorIdentifier),
      );

      await RawData.db.insertRow(
        session,
        RawData(sensorId: sensor.id!, temperature: data.temperature),
      );
    }
  }
}
