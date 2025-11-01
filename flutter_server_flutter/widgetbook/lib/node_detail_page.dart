import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_chart.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Mock version of NodeDetailPage for widgetbook
/// This doesn't make API calls but shows the UI layout
class MockNodeDetailPage extends StatefulWidget {
  final Node node;

  const MockNodeDetailPage({super.key, required this.node});

  @override
  State<MockNodeDetailPage> createState() => _MockNodeDetailPageState();
}

class _MockNodeDetailPageState extends State<MockNodeDetailPage> {
  String _selectedTimeRange = '24h';

  final Map<String, String> _timeRangeOptions = {
    '24h': 'Last 24 Hours',
    '7d': 'Last 7 Days',
    'all': 'All Time',
  };

  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    final sensors = node.sensors ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(node.name ?? node.identifier),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit dialog would open here')),
              );
            },
            tooltip: 'Edit Node',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Node information card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              node.name ?? node.identifier,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (node.name != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                'ID: ${node.identifier}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Edit dialog would open here'),
                            ),
                          );
                        },
                        tooltip: 'Edit Node',
                      ),
                    ],
                  ),
                  if (node.description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      node.description!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Text(
                    'Sensors: ${sensors.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Time range selector
          Row(
            children: [
              const Text(
                'Time Range:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButton<String>(
                  value: _selectedTimeRange,
                  isExpanded: true,
                  items: _timeRangeOptions.entries
                      .map(
                        (entry) => DropdownMenuItem(
                          value: entry.key,
                          child: Text(entry.value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedTimeRange = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Temperature charts for each sensor
          if (sensors.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(child: Text('No sensors available')),
              ),
            )
          else
            ...sensors.map(
              (sensor) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    TemperatureChart(
                      sensor: sensor,
                      timeRange: _selectedTimeRange,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Edit sensor: ${sensor.name ?? sensor.identifier}',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text('Edit Sensor'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Helper to generate sample data
List<RawData> generateData(int count, Duration interval, double baseTemp) {
  final data = <RawData>[];
  final now = DateTime.now();
  final sensorId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');

  for (int i = 0; i < count; i++) {
    final time = now.subtract(
      Duration(minutes: interval.inMinutes * (count - i)),
    );
    final temp = baseTemp + (2.0 * (0.5 - (i % 10) / 10.0));

    data.add(RawData(sensorId: sensorId, temperature: temp, createdAt: time));
  }

  return data;
}

@widgetbook.UseCase(name: 'Single Sensor Node', type: MockNodeDetailPage)
Widget nodeDetailSingleSensorUseCase(BuildContext context) {
  final nodeId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');
  final node = Node(
    id: nodeId,
    identifier: 'node-001',
    name: 'Living Room Node',
    description: 'Main temperature monitoring node in the living room',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: nodeId,
        name: 'Main Sensor',
        description: 'Primary temperature sensor',
        rawDataList: generateData(288, const Duration(minutes: 5), 22.0),
      ),
    ],
  );

  return MockNodeDetailPage(node: node);
}

@widgetbook.UseCase(name: 'Multiple Sensors Node', type: MockNodeDetailPage)
Widget nodeDetailMultipleSensorsUseCase(BuildContext context) {
  final nodeId = UuidValue.fromString('00000000-0000-0000-0000-000000000002');
  final node = Node(
    id: nodeId,
    identifier: 'node-002',
    name: 'Kitchen Node',
    description: 'Multi-zone temperature monitoring in kitchen area',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: nodeId,
        name: 'Main Area',
        description: 'Central kitchen temperature',
        rawDataList: generateData(288, const Duration(minutes: 5), 23.0),
      ),
      Sensor(
        identifier: 'sensor-002',
        parentNodeId: nodeId,
        name: 'Near Oven',
        description: 'Temperature near cooking area',
        rawDataList: generateData(288, const Duration(minutes: 5), 27.0),
      ),
      Sensor(
        identifier: 'sensor-003',
        parentNodeId: nodeId,
        name: 'Pantry',
        description: 'Storage area temperature',
        rawDataList: generateData(288, const Duration(minutes: 5), 20.0),
      ),
    ],
  );

  return MockNodeDetailPage(node: node);
}

@widgetbook.UseCase(name: 'Node Without Description', type: MockNodeDetailPage)
Widget nodeDetailNoDescriptionUseCase(BuildContext context) {
  final nodeId = UuidValue.fromString('00000000-0000-0000-0000-000000000003');
  final node = Node(
    id: nodeId,
    identifier: 'node-003',
    name: 'Simple Node',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: nodeId,
        name: 'Temperature Sensor',
        rawDataList: generateData(288, const Duration(minutes: 5), 21.5),
      ),
    ],
  );

  return MockNodeDetailPage(node: node);
}

@widgetbook.UseCase(name: 'Node with No Data', type: MockNodeDetailPage)
Widget nodeDetailNoDataUseCase(BuildContext context) {
  final nodeId = UuidValue.fromString('00000000-0000-0000-0000-000000000004');
  final node = Node(
    id: nodeId,
    identifier: 'node-004',
    name: 'New Node',
    description: 'Recently added, no data yet',
    sensors: [
      Sensor(
        identifier: 'sensor-001',
        parentNodeId: nodeId,
        name: 'Sensor 1',
        rawDataList: [],
      ),
    ],
  );

  return MockNodeDetailPage(node: node);
}

@widgetbook.UseCase(name: 'Node with No Sensors', type: MockNodeDetailPage)
Widget nodeDetailNoSensorsUseCase(BuildContext context) {
  final nodeId = UuidValue.fromString('00000000-0000-0000-0000-000000000005');
  final node = Node(
    id: nodeId,
    identifier: 'node-005',
    name: 'Unconfigured Node',
    description: 'Node has been set up but no sensors attached yet',
    sensors: [],
  );

  return MockNodeDetailPage(node: node);
}

@widgetbook.UseCase(name: 'Node with Many Sensors', type: MockNodeDetailPage)
Widget nodeDetailManySensorsUseCase(BuildContext context) {
  final nodeId = UuidValue.fromString('00000000-0000-0000-0000-000000000006');
  final sensors = List.generate(
    6,
    (i) => Sensor(
      identifier: 'sensor-00$i',
      parentNodeId: nodeId,
      name: 'Sensor ${i + 1}',
      description: 'Zone ${i + 1} temperature monitoring',
      rawDataList: generateData(288, const Duration(minutes: 5), 20.0 + i),
    ),
  );

  final node = Node(
    id: nodeId,
    identifier: 'node-006',
    name: 'Server Room Node',
    description: 'Comprehensive temperature monitoring with multiple zones',
    sensors: sensors,
  );

  return MockNodeDetailPage(node: node);
}
