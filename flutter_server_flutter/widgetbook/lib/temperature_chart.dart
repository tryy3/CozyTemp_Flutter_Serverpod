import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_chart.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

List<RawData> generateTemperatureData({
  required int count,
  required DateTime startTime,
  required Duration interval,
  required double baseTemp,
  double variation = 2.0,
}) {
  final data = <RawData>[];
  final sensorId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');

  for (int i = 0; i < count; i++) {
    final time = startTime.add(interval * i);
    final temp =
        baseTemp +
        (variation * (0.5 - (i % 10) / 10.0)) +
        (variation * 0.2 * ((i % 30) / 30.0));

    data.add(
      RawData(
        sensorId: sensorId,
        temperature: temp,
        createdAt: time,
        calibration: CalibratedTemperature(temperature: temp),
      ),
    );
  }

  return data;
}

@widgetbook.UseCase(name: 'default', type: TemperatureChart)
Widget buildTemperatureChartUseCase(BuildContext context) {
  final timeRange = context.knobs.list(
    label: 'timeRange',
    options: ['24h', '7d', 'all'],
    initialOption: '24h',
  );

  final baseTemp = context.knobs.double.slider(
    label: 'baseTemp',
    initialValue: 22.0,
    min: -20.0,
    max: 50.0,
    divisions: 140,
  );

  final variation = context.knobs.double.slider(
    label: 'variation',
    initialValue: 3.0,
    min: 0.0,
    max: 10.0,
    divisions: 20,
  );

  final now = DateTime.now();
  final count = timeRange == '24h' ? 288 : (timeRange == '7d' ? 168 : 30);
  final interval = timeRange == '24h'
      ? const Duration(minutes: 5)
      : (timeRange == '7d'
            ? const Duration(hours: 1)
            : const Duration(days: 1));
  final startTime = timeRange == '24h'
      ? now.subtract(const Duration(hours: 24))
      : (timeRange == '7d'
            ? now.subtract(const Duration(days: 7))
            : now.subtract(const Duration(days: 30)));

  final sensor = Sensor(
    identifier: 'sensor-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Interactive Chart',
    description: 'Adjust parameters to explore the chart',
    rawDataList: generateTemperatureData(
      count: count,
      startTime: startTime,
      interval: interval,
      baseTemp: baseTemp,
      variation: variation,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: timeRange);
}

@widgetbook.UseCase(name: '24h view', type: TemperatureChart)
Widget buildTemperatureChart24hUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Living Room',
    description: 'Temperature over the last 24 hours',
    rawDataList: generateTemperatureData(
      count: 288,
      startTime: now.subtract(const Duration(hours: 24)),
      interval: const Duration(minutes: 5),
      baseTemp: 22.0,
      variation: 3.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: '7d view', type: TemperatureChart)
Widget buildTemperatureChart7dUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-002',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Bedroom',
    description: 'Temperature over the last 7 days',
    rawDataList: generateTemperatureData(
      count: 168,
      startTime: now.subtract(const Duration(days: 7)),
      interval: const Duration(hours: 1),
      baseTemp: 20.5,
      variation: 4.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '7d');
}

@widgetbook.UseCase(name: 'all time view', type: TemperatureChart)
Widget buildTemperatureChartAllTimeUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-003',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Kitchen',
    description: 'Temperature over the last 30 days',
    rawDataList: generateTemperatureData(
      count: 30,
      startTime: now.subtract(const Duration(days: 30)),
      interval: const Duration(days: 1),
      baseTemp: 23.0,
      variation: 5.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: 'all');
}

@widgetbook.UseCase(name: 'high temperature', type: TemperatureChart)
Widget buildTemperatureChartHighTempUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-004',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Server Room',
    description: 'High temperature environment',
    rawDataList: generateTemperatureData(
      count: 288,
      startTime: now.subtract(const Duration(hours: 24)),
      interval: const Duration(minutes: 5),
      baseTemp: 45.0,
      variation: 5.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: 'low temperature', type: TemperatureChart)
Widget buildTemperatureChartLowTempUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-005',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Freezer',
    description: 'Sub-zero temperatures',
    rawDataList: generateTemperatureData(
      count: 288,
      startTime: now.subtract(const Duration(hours: 24)),
      interval: const Duration(minutes: 5),
      baseTemp: -18.0,
      variation: 2.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: 'stable temperature', type: TemperatureChart)
Widget buildTemperatureChartStableUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-006',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Climate Controlled Room',
    description: 'Minimal temperature variation',
    rawDataList: generateTemperatureData(
      count: 288,
      startTime: now.subtract(const Duration(hours: 24)),
      interval: const Duration(minutes: 5),
      baseTemp: 22.0,
      variation: 0.2,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: 'few data points', type: TemperatureChart)
Widget buildTemperatureChartFewPointsUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-007',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'New Sensor',
    description: 'Just started collecting data',
    rawDataList: generateTemperatureData(
      count: 5,
      startTime: now.subtract(const Duration(hours: 2)),
      interval: const Duration(minutes: 30),
      baseTemp: 21.0,
      variation: 1.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: 'no data', type: TemperatureChart)
Widget buildTemperatureChartNoDataUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-008',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Disconnected Sensor',
    description: 'No data available',
    rawDataList: [],
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: 'no description', type: TemperatureChart)
Widget buildTemperatureChartNoDescriptionUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-009',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Simple Sensor',
    rawDataList: generateTemperatureData(
      count: 288,
      startTime: now.subtract(const Duration(hours: 24)),
      interval: const Duration(minutes: 5),
      baseTemp: 22.0,
      variation: 2.0,
    ),
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}

@widgetbook.UseCase(name: 'rising trend', type: TemperatureChart)
Widget buildTemperatureChartRisingTrendUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensorId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');

  final data = <RawData>[];
  for (int i = 0; i < 288; i++) {
    final time = now
        .subtract(const Duration(hours: 24))
        .add(Duration(minutes: 5 * i));
    final temp = 18.0 + (i / 288.0) * 8.0;

    data.add(
      RawData(
        sensorId: sensorId,
        temperature: temp,
        createdAt: time,
        calibration: CalibratedTemperature(temperature: temp),
      ),
    );
  }

  final sensor = Sensor(
    identifier: 'sensor-010',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Heating Zone',
    description: 'Temperature increasing throughout the day',
    rawDataList: data,
  );

  return TemperatureChart(sensor: sensor, timeRange: '24h');
}
