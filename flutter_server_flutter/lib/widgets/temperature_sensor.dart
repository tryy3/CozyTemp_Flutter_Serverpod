import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_layout_constants.dart';

/// A widget that displays a single temperature sensor with its current reading
class TemperatureSensor extends StatelessWidget {
  /// The sensor to display
  final Sensor sensor;

  /// Optional width for the sensor widget
  /// If not provided, the widget will expand to fill available space
  final double? width;

  const TemperatureSensor({
    super.key,
    required this.sensor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Get the latest temperature from the raw data list
    final rawDataList = sensor.rawDataList ?? [];
    final latestTemp =
        rawDataList.isNotEmpty ? rawDataList.last.temperature : null;

    final container = Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: sensorPaddingHorizontal,
        vertical: sensorPaddingVertical,
      ),
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

    // If no width is specified, allow the container to expand
    return width == null ? Flexible(child: container) : container;
  }
}
