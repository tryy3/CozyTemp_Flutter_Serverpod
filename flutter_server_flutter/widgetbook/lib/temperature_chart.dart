import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_chart.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Helper function to generate sample temperature data
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
    // Add some variation to make it look realistic
    final temp =
        baseTemp +
        (variation * (0.5 - (i % 10) / 10.0)) +
        (variation * 0.2 * ((i % 30) / 30.0));

    data.add(RawData(sensorId: sensorId, temperature: temp, createdAt: time));
  }

  return data;
}

@widgetbook.UseCase(name: '24h View - Normal Trend', type: TemperatureChart)
Widget chart24hNormalUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-001',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Living Room',
    description: 'Temperature over the last 24 hours',
    rawDataList: generateTemperatureData(
      count: 288, // 5-minute intervals for 24 hours
      startTime: now.subtract(const Duration(hours: 24)),
      interval: const Duration(minutes: 5),
      baseTemp: 22.0,
      variation: 3.0,
    ),
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: '7d View - Weekly Trend', type: TemperatureChart)
Widget chart7dWeeklyUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-002',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Bedroom',
    description: 'Temperature over the last 7 days',
    rawDataList: generateTemperatureData(
      count: 168, // 1-hour intervals for 7 days
      startTime: now.subtract(const Duration(days: 7)),
      interval: const Duration(hours: 1),
      baseTemp: 20.5,
      variation: 4.0,
    ),
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '7d'),
    ),
  );
}

@widgetbook.UseCase(name: 'All Time - Monthly View', type: TemperatureChart)
Widget chartAllTimeUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensor = Sensor(
    identifier: 'sensor-003',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Kitchen',
    description: 'Temperature over the last 30 days',
    rawDataList: generateTemperatureData(
      count: 30, // Daily intervals for 30 days
      startTime: now.subtract(const Duration(days: 30)),
      interval: const Duration(days: 1),
      baseTemp: 23.0,
      variation: 5.0,
    ),
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: 'all'),
    ),
  );
}

@widgetbook.UseCase(name: 'High Temperature Range', type: TemperatureChart)
Widget chartHighTempUseCase(BuildContext context) {
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

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: 'Low Temperature Range', type: TemperatureChart)
Widget chartLowTempUseCase(BuildContext context) {
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

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: 'Very Stable Temperature', type: TemperatureChart)
Widget chartStableTempUseCase(BuildContext context) {
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

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: 'Few Data Points', type: TemperatureChart)
Widget chartFewPointsUseCase(BuildContext context) {
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

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: 'No Data Available', type: TemperatureChart)
Widget chartNoDataUseCase(BuildContext context) {
  final sensor = Sensor(
    identifier: 'sensor-008',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Disconnected Sensor',
    description: 'No data available',
    rawDataList: [],
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: 'Sensor Without Description', type: TemperatureChart)
Widget chartNoDescriptionUseCase(BuildContext context) {
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

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}

@widgetbook.UseCase(name: 'Rising Temperature Trend', type: TemperatureChart)
Widget chartRisingTrendUseCase(BuildContext context) {
  final now = DateTime.now();
  final sensorId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');

  // Create a rising trend
  final data = <RawData>[];
  for (int i = 0; i < 288; i++) {
    final time = now
        .subtract(const Duration(hours: 24))
        .add(Duration(minutes: 5 * i));
    final temp = 18.0 + (i / 288.0) * 8.0; // Rise from 18°C to 26°C

    data.add(RawData(sensorId: sensorId, temperature: temp, createdAt: time));
  }

  final sensor = Sensor(
    identifier: 'sensor-010',
    parentNodeId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
    name: 'Heating Zone',
    description: 'Temperature increasing throughout the day',
    rawDataList: data,
  );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: TemperatureChart(sensor: sensor, timeRange: '24h'),
    ),
  );
}
