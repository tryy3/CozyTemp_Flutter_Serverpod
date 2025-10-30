import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';

/// A widget that displays a single temperature sensor with its current reading
class TemperatureSensor extends StatelessWidget {
  /// The sensor to display
  final Sensor sensor;

  const TemperatureSensor({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    // Get the latest temperature from the raw data list
    final rawDataList = sensor.rawDataList ?? [];
    final latestTemp =
        rawDataList.isNotEmpty ? rawDataList.last.temperature : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            sensor.name ?? sensor.identifier,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          if (sensor.description != null)
            Text(
              sensor.description!,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          Text(
            latestTemp != null ? '${latestTemp.toStringAsFixed(1)}°C' : 'N/A',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
