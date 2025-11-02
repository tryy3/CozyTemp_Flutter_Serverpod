import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_nodes_list.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: TemperatureNodesList)
Widget buildTemperatureNodesListUseCase(BuildContext context) {
  final nodeCount = context.knobs.int.slider(
    label: 'nodeCount',
    initialValue: 3,
    min: 1,
    max: 10,
    divisions: 9,
  );

  final nodes = List.generate(
    nodeCount,
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
              calibration: CalibratedTemperature(
                temperature: 18.0 + (index * 1.5),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureNodesList(nodes: nodes),
  );
}

@widgetbook.UseCase(name: 'empty', type: TemperatureNodesList)
Widget buildTemperatureNodesListEmptyUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: TemperatureNodesList(nodes: []),
  );
}

@widgetbook.UseCase(name: 'single node', type: TemperatureNodesList)
Widget buildTemperatureNodesListSingleUseCase(BuildContext context) {
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
            calibration: CalibratedTemperature(temperature: 22.5),
          ),
        ],
      ),
    ],
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureNodesList(nodes: [node]),
  );
}

@widgetbook.UseCase(name: 'multi sensor nodes', type: TemperatureNodesList)
Widget buildTemperatureNodesListMultiSensorUseCase(BuildContext context) {
  final nodes = List.generate(
    4,
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
              calibration: CalibratedTemperature(
                temperature: 20.0 + (nodeIndex * 1.2) + (sensorIndex * 0.5),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureNodesList(nodes: nodes),
  );
}
