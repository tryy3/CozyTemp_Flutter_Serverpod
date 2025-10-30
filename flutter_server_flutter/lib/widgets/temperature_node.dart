import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_sensor.dart';
import 'package:flutter_server_flutter/widgets/temperature_layout_constants.dart';

class TemperatureNode extends StatelessWidget {
  /// The node to display
  final Node node;

  const TemperatureNode({super.key, required this.node});

  /// Builds a card for each node with its temperature sensors
  @override
  Widget build(BuildContext context) {
    final sensors = node.sensors ?? [];

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: minNodeWidth,
        maxWidth: maxNodeWidth,
      ),
      child: Card(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate available width for sensors (subtract card padding)
            final availableWidth = constraints.maxWidth - (nodeCardPadding * 2);

            // Determine how many sensors per row based on breakpoint
            final sensorsPerRow = availableWidth >= sensorBreakpoint ? 2 : 1;

            // Calculate sensor width
            final sensorWidth =
                calculateSensorWidth(availableWidth, sensorsPerRow);

            return Padding(
              padding: const EdgeInsets.all(nodeCardPadding),
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
                      spacing: sensorSpacing,
                      runSpacing: sensorRunSpacing,
                      children: sensors
                          .map((sensor) => TemperatureSensor(
                                sensor: sensor,
                                width: sensorWidth,
                              ))
                          .toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
