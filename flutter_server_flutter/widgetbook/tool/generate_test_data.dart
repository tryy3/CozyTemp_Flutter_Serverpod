// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter_server_client/flutter_server_client.dart';

/// Script to generate deterministic test data for Widgetbook visual regression testing.
///
/// Run this script from the widgetbook directory:
/// dart run tool/generate_test_data.dart
void main() {
  print('Generating test data...');

  // Create test data directory if it doesn't exist
  final dataDir = Directory('lib/test_data');
  if (!dataDir.existsSync()) {
    dataDir.createSync(recursive: true);
  }

  // Generate different datasets
  _generateDataset(
    filename: 'lib/test_data/24h_living_room.json',
    count: 288,
    baseTime: DateTime(2024, 11, 1, 12, 0), // Fixed date for consistency
    interval: const Duration(minutes: 5),
    baseTemp: 22.0,
    variation: 3.0,
  );

  _generateDataset(
    filename: 'lib/test_data/7d_bedroom.json',
    count: 168,
    baseTime: DateTime(2024, 10, 25, 12, 0),
    interval: const Duration(hours: 1),
    baseTemp: 20.5,
    variation: 4.0,
  );

  _generateDataset(
    filename: 'lib/test_data/30d_kitchen.json',
    count: 30,
    baseTime: DateTime(2024, 10, 2, 12, 0),
    interval: const Duration(days: 1),
    baseTemp: 23.0,
    variation: 5.0,
  );

  _generateDataset(
    filename: 'lib/test_data/high_temp_server_room.json',
    count: 288,
    baseTime: DateTime(2024, 11, 1, 12, 0),
    interval: const Duration(minutes: 5),
    baseTemp: 45.0,
    variation: 5.0,
  );

  _generateDataset(
    filename: 'lib/test_data/low_temp_freezer.json',
    count: 288,
    baseTime: DateTime(2024, 11, 1, 12, 0),
    interval: const Duration(minutes: 5),
    baseTemp: -18.0,
    variation: 2.0,
  );

  _generateDataset(
    filename: 'lib/test_data/stable_climate_room.json',
    count: 288,
    baseTime: DateTime(2024, 11, 1, 12, 0),
    interval: const Duration(minutes: 5),
    baseTemp: 22.0,
    variation: 0.2,
  );

  _generateDataset(
    filename: 'lib/test_data/few_points_new_sensor.json',
    count: 5,
    baseTime: DateTime(2024, 11, 1, 10, 0),
    interval: const Duration(minutes: 30),
    baseTemp: 21.0,
    variation: 1.0,
  );

  _generateRisingTrendDataset(
    filename: 'lib/test_data/rising_trend_heating.json',
    count: 288,
    baseTime: DateTime(2024, 11, 1, 12, 0),
    interval: const Duration(minutes: 5),
    startTemp: 18.0,
    endTemp: 26.0,
  );

  print('✓ Test data generated successfully!');
}

void _generateDataset({
  required String filename,
  required int count,
  required DateTime baseTime,
  required Duration interval,
  required double baseTemp,
  required double variation,
}) {
  final data = <RawData>[];
  final sensorId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');

  for (int i = 0; i < count; i++) {
    final time = baseTime.add(interval * i);
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

  final jsonData = data.map((e) => e.toJson()).toList();
  final file = File(filename);
  file.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(jsonData));

  print('✓ Generated $filename with $count data points');
}

void _generateRisingTrendDataset({
  required String filename,
  required int count,
  required DateTime baseTime,
  required Duration interval,
  required double startTemp,
  required double endTemp,
}) {
  final data = <RawData>[];
  final sensorId = UuidValue.fromString('00000000-0000-0000-0000-000000000001');

  for (int i = 0; i < count; i++) {
    final time = baseTime.add(interval * i);
    final temp = startTemp + (i / count) * (endTemp - startTemp);

    data.add(
      RawData(
        sensorId: sensorId,
        temperature: temp,
        createdAt: time,
        calibration: CalibratedTemperature(temperature: temp),
      ),
    );
  }

  final jsonData = data.map((e) => e.toJson()).toList();
  final file = File(filename);
  file.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(jsonData));

  print('✓ Generated $filename with $count data points');
}
