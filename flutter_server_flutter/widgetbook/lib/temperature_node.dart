import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_node.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'No Sensors', type: TemperatureNode)
Widget buildTemperatureNodeNoSensorsUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Empty Node',
    description: 'A node without any sensors',
    sensors: [],
  );

  return Center(child: TemperatureNode(node: node));
}

@widgetbook.UseCase(name: 'One Sensor', type: TemperatureNode)
Widget buildTemperatureNodeOneSensorUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Living Room',
    description: 'Single sensor monitoring',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Main Sensor',
        description: 'Center of room',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000001',
            ),
            temperature: 22.5,
            calibration: CalibratedTemperature(temperature: 22.5),
          ),
        ],
      ),
    ],
  );

  return Center(child: TemperatureNode(node: node));
}

@widgetbook.UseCase(name: 'Many Sensors', type: TemperatureNode)
Widget buildTemperatureNodeManySensorsUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Large Room',
    description: 'Multi-sensor coverage',
    sensors: List.generate(
      6,
      (index) => Sensor(
        identifier: 'sensor-${index.toString().padLeft(3, '0')}',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Sensor ${index + 1}',
        description: 'Position ${String.fromCharCode(65 + index)}',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-${index.toString().padLeft(12, '0')}',
            ),
            temperature: 20.0 + (index * 0.7),
            calibration: CalibratedTemperature(
              temperature: 20.0 + (index * 0.7),
            ),
          ),
        ],
      ),
    ),
  );

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNode(node: node),
    ),
  );
}

@widgetbook.UseCase(name: 'Inactive Sensors', type: TemperatureNode)
Widget buildTemperatureNodeInactiveSensorsUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Test Node',
    description: 'Mix of active and inactive sensors',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Active Sensor',
        description: 'Working normally',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000001',
            ),
            temperature: 22.5,
            calibration: CalibratedTemperature(temperature: 22.5),
          ),
        ],
      ),
      Sensor(
        identifier: 'sensor-002',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Inactive Sensor',
        description: 'No data available',
        rawDataList: [],
      ),
      Sensor(
        identifier: 'sensor-003',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Another Active',
        description: 'Working normally',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000003',
            ),
            temperature: 23.1,
            calibration: CalibratedTemperature(temperature: 23.1),
          ),
        ],
      ),
    ],
  );

  return Center(child: TemperatureNode(node: node));
}

@widgetbook.UseCase(name: 'Long Text', type: TemperatureNode)
Widget buildTemperatureNodeLongTextUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Very Long Node Name That Should Test Text Wrapping Behavior',
    description:
        'This is a very long description that tests how the node handles extensive text content and whether it wraps properly within the card boundaries',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Temperature Sensor',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000001',
            ),
            temperature: 22.5,
            calibration: CalibratedTemperature(temperature: 22.5),
          ),
        ],
      ),
    ],
  );

  return Center(child: TemperatureNode(node: node));
}
