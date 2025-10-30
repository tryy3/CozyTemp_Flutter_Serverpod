import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_sensor.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Scaffold renderMultipleSensors(List<Sensor> sensors) {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: sensors
              .map((sensor) => TemperatureSensor(sensor: sensor))
              .toList(),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Normal Temperature', type: TemperatureSensor)
Widget normalTemperatureSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Living Room Sensor',
    description: 'Near the window',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
        temperature: 22.5,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'High Temperature', type: TemperatureSensor)
Widget highTemperatureSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-002',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Hot Area Sensor',
    description: 'Server room',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000002'),
        temperature: 45.7,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'Low Temperature', type: TemperatureSensor)
Widget lowTemperatureSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-003',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Freezer Sensor',
    description: 'Inside freezer unit',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000003'),
        temperature: -18.2,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'Zero Temperature', type: TemperatureSensor)
Widget zeroTemperatureSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-004',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Ice Point Sensor',
    description: 'Calibration reference',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000004'),
        temperature: 0.0,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'No Temperature Data', type: TemperatureSensor)
Widget noTemperatureDataSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-005',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Inactive Sensor',
    description: 'Not yet reporting data',
    rawDataList: [],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'No Description', type: TemperatureSensor)
Widget noDescriptionSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-006',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Simple Sensor',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000006'),
        temperature: 21.3,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'Long Name and Description', type: TemperatureSensor)
Widget longTextSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-007',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Very Long Sensor Name That Might Wrap',
    description:
        'This is a very long description that tests how the widget handles longer text content',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000007'),
        temperature: 23.8,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'Only Identifier', type: TemperatureSensor)
Widget onlyIdentifierSensorUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-minimal-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000008'),
        temperature: 20.1,
      ),
    ],
  );

  return renderMultipleSensors([sensor]);
}

@widgetbook.UseCase(name: 'Multiple in Wrap', type: TemperatureSensor)
Widget multipleSensorsInWrapUseCase(BuildContext context) {
  final sensors = [
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
    Sensor(
      identifier: 'sensor-002',
      parentNodeId: UuidValue.fromString(
        '00000000-0000-0000-0000-000000000001',
      ),
      name: 'Sensor 2',
      rawDataList: [
        RawData(
          sensorId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000002',
          ),
          temperature: 21.8,
        ),
      ],
    ),
    Sensor(
      identifier: 'sensor-003',
      parentNodeId: UuidValue.fromString(
        '00000000-0000-0000-0000-000000000001',
      ),
      name: 'Sensor 3',
      rawDataList: [
        RawData(
          sensorId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000003',
          ),
          temperature: 23.1,
        ),
      ],
    ),
    Sensor(
      identifier: 'sensor-004',
      parentNodeId: UuidValue.fromString(
        '00000000-0000-0000-0000-000000000001',
      ),
      name: 'Sensor 4',
      rawDataList: [
        RawData(
          sensorId: UuidValue.fromString(
            '00000000-0000-0000-0000-000000000004',
          ),
          temperature: 19.7,
        ),
      ],
    ),
  ];

  return renderMultipleSensors(sensors);
}
