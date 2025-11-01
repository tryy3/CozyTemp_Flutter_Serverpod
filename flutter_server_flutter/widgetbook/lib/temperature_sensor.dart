import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_sensor.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: TemperatureSensor)
Widget buildTemperatureSensorUseCase(BuildContext context) {
  final temperature = context.knobs.double.slider(
    label: 'temperature',
    initialValue: 22.5,
    min: -30.0,
    max: 60.0,
    divisions: 180,
  );

  final showDescription = context.knobs.boolean(
    label: 'showDescription',
    initialValue: true,
  );

  final sensorName = context.knobs.string(
    label: 'sensorName',
    initialValue: 'Living Room Sensor',
  );

  final sensor = Sensor(
    identifier: 'sensor-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: sensorName,
    description: showDescription ? 'Near the window' : null,
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
        temperature: temperature,
        calibration: CalibratedTemperature(temperature: temperature),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'high temperature', type: TemperatureSensor)
Widget buildTemperatureSensorHighTempUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-002',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Hot Area Sensor',
    description: 'Server room',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000002'),
        temperature: 45.7,
        calibration: CalibratedTemperature(temperature: 45.7),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'low temperature', type: TemperatureSensor)
Widget buildTemperatureSensorLowTempUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-003',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Freezer Sensor',
    description: 'Inside freezer unit',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000003'),
        temperature: -18.2,
        calibration: CalibratedTemperature(temperature: -18.2),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'zero temperature', type: TemperatureSensor)
Widget buildTemperatureSensorZeroTempUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-004',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Ice Point Sensor',
    description: 'Calibration reference',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000004'),
        temperature: 0.0,
        calibration: CalibratedTemperature(temperature: 0.0),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'no data', type: TemperatureSensor)
Widget buildTemperatureSensorNoDataUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-005',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Inactive Sensor',
    description: 'Not yet reporting data',
    rawDataList: [],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'no description', type: TemperatureSensor)
Widget buildTemperatureSensorNoDescriptionUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-006',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Simple Sensor',
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000006'),
        temperature: 21.3,
        calibration: CalibratedTemperature(temperature: 21.3),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'long text', type: TemperatureSensor)
Widget buildTemperatureSensorLongTextUseCase(BuildContext context) {
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
        calibration: CalibratedTemperature(temperature: 23.8),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'only identifier', type: TemperatureSensor)
Widget buildTemperatureSensorOnlyIdentifierUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-minimal-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    rawDataList: [
      RawData(
        sensorId: UuidValue.fromString('00000000-0000-0000-0000-000000000008'),
        temperature: 20.1,
        calibration: CalibratedTemperature(temperature: 20.1),
      ),
    ],
  );

  return Center(child: TemperatureSensor(sensor: sensor));
}

@widgetbook.UseCase(name: 'multiple sensors', type: TemperatureSensor)
Widget buildTemperatureSensorMultipleUseCase(BuildContext context) {
  final sensorCount = context.knobs.int.slider(
    label: 'sensorCount',
    initialValue: 4,
    min: 1,
    max: 8,
    divisions: 7,
  );

  final sensors = List.generate(
    sensorCount,
    (index) => Sensor(
      identifier: 'sensor-00${index + 1}',
      parentNodeId: UuidValue.fromString(
        '00000000-0000-0000-0000-000000000001',
      ),
      name: 'Sensor ${index + 1}',
      rawDataList: [
        RawData(
          sensorId: UuidValue.fromString(
            '00000000-0000-0000-0000-00000000000${index + 1}',
          ),
          temperature: 20.0 + index * 0.8,
          calibration: CalibratedTemperature(temperature: 20.0 + index * 0.8),
        ),
      ],
    ),
  );

  return Center(
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
  );
}
