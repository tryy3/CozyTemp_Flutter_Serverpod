import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_nodes_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Empty List', type: TemperatureNodesList)
Widget emptyNodesListUseCase(BuildContext context) {
  return const Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Single Node with Sensors',
  type: TemperatureNodesList,
)
Widget singleNodeUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Living Room',
    description: 'Main living area sensors',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Temperature Sensor 1',
        description: 'Near the window',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000001',
            ),
            temperature: 22.5,
          ),
        ],
      ),
      Sensor(
        identifier: 'sensor-002',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Temperature Sensor 2',
        description: 'Near the door',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000002',
            ),
            temperature: 21.8,
          ),
        ],
      ),
    ],
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [node], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(name: 'Multiple Nodes', type: TemperatureNodesList)
Widget multipleNodesUseCase(BuildContext context) {
  final nodes = [
    Node(
      identifier: 'node-001',
      name: 'Living Room',
      description: 'Main living area sensors',
      sensors: [
        Sensor(
          identifier: 'sensor-001',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000001',
          ),
          name: 'Temperature Sensor 1',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000001',
              ),
              temperature: 22.5,
            ),
          ],
        ),
        Sensor(
          identifier: 'sensor-002',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000001',
          ),
          name: 'Temperature Sensor 2',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000002',
              ),
              temperature: 21.8,
            ),
          ],
        ),
      ],
    ),
    Node(
      identifier: 'node-002',
      name: 'Bedroom',
      description: 'Bedroom temperature monitoring',
      sensors: [
        Sensor(
          identifier: 'sensor-003',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000002',
          ),
          name: 'Bedroom Sensor',
          description: 'Next to bed',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000003',
              ),
              temperature: 19.2,
            ),
          ],
        ),
      ],
    ),
    Node(
      identifier: 'node-003',
      name: 'Kitchen',
      sensors: [
        Sensor(
          identifier: 'sensor-004',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000003',
          ),
          name: 'Kitchen Sensor',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000004',
              ),
              temperature: 24.1,
            ),
          ],
        ),
      ],
    ),
  ];

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: nodes, title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(name: 'Node with No Sensors', type: TemperatureNodesList)
Widget nodeWithNoSensorsUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Empty Node',
    description: 'A node without any sensors',
    sensors: [],
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [node], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Sensor with No Temperature Data',
  type: TemperatureNodesList,
)
Widget sensorWithNoDataUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Living Room',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Inactive Sensor',
        description: 'This sensor has no data yet',
        rawDataList: [],
      ),
    ],
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [node], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(name: 'Extreme Temperatures', type: TemperatureNodesList)
Widget extremeTemperaturesUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-test',
    name: 'Test Node',
    description: 'Testing extreme temperature values',
    sensors: [
      Sensor(
        identifier: 'sensor-hot',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Hot Sensor',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000001',
            ),
            temperature: 45.7,
          ),
        ],
      ),
      Sensor(
        identifier: 'sensor-cold',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Cold Sensor',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000002',
            ),
            temperature: -15.3,
          ),
        ],
      ),
      Sensor(
        identifier: 'sensor-normal',
        parentNodeId: UuidValue.fromString(
          '00000000-0000-0000-0000-000000000001',
        ),
        name: 'Normal Sensor',
        rawDataList: [
          RawData(
            sensorId: UuidValue.fromString(
              '00000000-0000-0000-0000-000000000003',
            ),
            temperature: 0.0,
          ),
        ],
      ),
    ],
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [node], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(name: 'Without Title', type: TemperatureNodesList)
Widget withoutTitleUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Living Room',
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
          ),
        ],
      ),
    ],
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [node]),
    ),
  );
}
