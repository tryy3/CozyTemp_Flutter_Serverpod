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
  final timeRange = context.knobs.object.dropdown(
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

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureChart(sensor: sensor, timeRange: timeRange),
  );
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

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureChart(sensor: sensor, timeRange: '24h'),
  );
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

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureChart(sensor: sensor, timeRange: '24h'),
  );
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

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TemperatureChart(sensor: sensor, timeRange: '24h'),
  );
}
