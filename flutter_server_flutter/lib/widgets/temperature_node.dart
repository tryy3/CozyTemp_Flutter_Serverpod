import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';

class TemperatureNode extends StatelessWidget {
  /// The node to display
  final Node node;

  const TemperatureNode({super.key, required this.node});

  /// Builds a card for each node with its temperature sensors
  @override
  Widget build(BuildContext context) {
    final sensors = node.sensors ?? [];

    return SizedBox(
      width: 400, // Fixed width for consistent grid-like layout
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Node: ${node.name ?? node.identifier}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // Add space between underline and decoration
                    color: Colors.transparent,
                    shadows: [
                      Shadow(offset: Offset(0, -5), color: Colors.black)
                    ],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              if (node.description != null) ...[
                const SizedBox(height: 4),
                Text(
                  node.description!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
              const SizedBox(height: 12),
              if (sensors.isEmpty)
                const Text('No sensors available')
              else
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children:
                      sensors.map((sensor) => _buildSensorRow(sensor)).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a row for each sensor showing its temperature
  Widget _buildSensorRow(Sensor sensor) {
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
