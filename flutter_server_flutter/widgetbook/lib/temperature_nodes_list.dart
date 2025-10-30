import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_node.dart';
import 'package:flutter_server_flutter/widgets/temperature_nodes_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// ============================================================================
// TemperatureNodesList Use Cases - Focus on multiple nodes and layout
// ============================================================================

@widgetbook.UseCase(name: 'Empty List', type: TemperatureNodesList)
Widget emptyNodesListUseCase(BuildContext context) {
  return const Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: [], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(name: 'Single Node', type: TemperatureNodesList)
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
        name: 'Sensor 1',
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
      child: TemperatureNodesList(nodes: [node], title: 'Temperature Nodes'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Two Nodes (Side by Side)',
  type: TemperatureNodesList,
)
Widget twoNodesUseCase(BuildContext context) {
  final nodes = [
    Node(
      identifier: 'node-001',
      name: 'Living Room',
      description: 'Main living area',
      sensors: [
        Sensor(
          identifier: 'sensor-001',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000001',
          ),
          name: 'Temperature',
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
    ),
    Node(
      identifier: 'node-002',
      name: 'Bedroom',
      description: 'Bedroom monitoring',
      sensors: [
        Sensor(
          identifier: 'sensor-002',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000002',
          ),
          name: 'Temperature',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000002',
              ),
              temperature: 19.2,
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

@widgetbook.UseCase(
  name: 'Many Nodes (Tests Wrapping)',
  type: TemperatureNodesList,
)
Widget manyNodesUseCase(BuildContext context) {
  final nodes = List.generate(
    8,
    (index) => Node(
      identifier: 'node-${index.toString().padLeft(3, '0')}',
      name: 'Room ${index + 1}',
      description: 'Room ${index + 1} sensors',
      sensors: [
        Sensor(
          identifier: 'sensor-${index.toString().padLeft(3, '0')}',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-${index.toString().padLeft(12, '0')}',
          ),
          name: 'Temperature Sensor',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-${index.toString().padLeft(12, '0')}',
              ),
              temperature: 18.0 + (index * 1.5),
            ),
          ],
        ),
      ],
    ),
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: nodes, title: 'All Rooms'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Many Nodes with Multiple Sensors',
  type: TemperatureNodesList,
)
Widget manyNodesManySensorsUseCase(BuildContext context) {
  final nodes = List.generate(
    6,
    (nodeIndex) => Node(
      identifier: 'node-${nodeIndex.toString().padLeft(3, '0')}',
      name: 'Zone ${nodeIndex + 1}',
      description: 'Zone ${nodeIndex + 1} multi-sensor monitoring',
      sensors: List.generate(
        3,
        (sensorIndex) => Sensor(
          identifier:
              'sensor-$nodeIndex-${sensorIndex.toString().padLeft(2, '0')}',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-${nodeIndex.toString().padLeft(12, '0')}',
          ),
          name: 'Sensor ${String.fromCharCode(65 + sensorIndex)}',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-${(nodeIndex * 10 + sensorIndex).toString().padLeft(12, '0')}',
              ),
              temperature: 20.0 + (nodeIndex * 1.2) + (sensorIndex * 0.5),
            ),
          ],
        ),
      ),
    ),
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: nodes, title: 'All Zones'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Mixed - Some Empty Nodes',
  type: TemperatureNodesList,
)
Widget mixedEmptyNodesUseCase(BuildContext context) {
  final nodes = [
    Node(
      identifier: 'node-001',
      name: 'Living Room',
      description: 'Has sensors',
      sensors: [
        Sensor(
          identifier: 'sensor-001',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000001',
          ),
          name: 'Temperature',
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
    ),
    Node(
      identifier: 'node-002',
      name: 'Bedroom',
      description: 'No sensors yet',
      sensors: [],
    ),
    Node(
      identifier: 'node-003',
      name: 'Kitchen',
      description: 'Has sensors',
      sensors: [
        Sensor(
          identifier: 'sensor-003',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000003',
          ),
          name: 'Temperature',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000003',
              ),
              temperature: 24.1,
            ),
          ],
        ),
      ],
    ),
    Node(
      identifier: 'node-004',
      name: 'Bathroom',
      description: 'No sensors yet',
      sensors: [],
    ),
  ];

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: nodes, title: 'All Rooms'),
    ),
  );
}

@widgetbook.UseCase(name: 'Without Title', type: TemperatureNodesList)
Widget withoutTitleUseCase(BuildContext context) {
  final nodes = [
    Node(
      identifier: 'node-001',
      name: 'Living Room',
      sensors: [
        Sensor(
          identifier: 'sensor-001',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000001',
          ),
          name: 'Temperature',
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
    ),
    Node(
      identifier: 'node-002',
      name: 'Bedroom',
      sensors: [
        Sensor(
          identifier: 'sensor-002',
          parentNodeId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000002',
          ),
          name: 'Temperature',
          rawDataList: [
            RawData(
              sensorId: UuidValue.fromString(
                '00000000-0000-0000-0000-000000000002',
              ),
              temperature: 19.2,
            ),
          ],
        ),
      ],
    ),
  ];

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureNodesList(nodes: nodes),
    ),
  );
}

// ============================================================================
// TemperatureNode Use Cases - Focus on single node variations
// ============================================================================

@widgetbook.UseCase(name: 'Node with No Sensors', type: TemperatureNode)
Widget nodeWithNoSensorsUseCase(BuildContext context) {
  final node = Node(
    identifier: 'node-001',
    name: 'Empty Node',
    description: 'A node without any sensors',
    sensors: [],
  );

  return Scaffold(
    body: Center(child: TemperatureNode(node: node)),
  );
}

@widgetbook.UseCase(name: 'Node with One Sensor', type: TemperatureNode)
Widget nodeWithOneSensorUseCase(BuildContext context) {
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
          ),
        ],
      ),
    ],
  );

  return Scaffold(
    body: Center(child: TemperatureNode(node: node)),
  );
}

@widgetbook.UseCase(name: 'Node with Many Sensors', type: TemperatureNode)
Widget nodeWithManySensorsUseCase(BuildContext context) {
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
          ),
        ],
      ),
    ),
  );

  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: TemperatureNode(node: node),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Node with Inactive Sensors', type: TemperatureNode)
Widget nodeWithInactiveSensorsUseCase(BuildContext context) {
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
          ),
        ],
      ),
    ],
  );

  return Scaffold(
    body: Center(child: TemperatureNode(node: node)),
  );
}

@widgetbook.UseCase(
  name: 'Node - Long Name and Description',
  type: TemperatureNode,
)
Widget nodeWithLongTextUseCase(BuildContext context) {
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
          ),
        ],
      ),
    ],
  );

  return Scaffold(
    body: Center(child: TemperatureNode(node: node)),
  );
}
