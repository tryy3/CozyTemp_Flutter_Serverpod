import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_sensor.dart';
import 'package:flutter_server_flutter/widgets/temperature_layout_constants.dart';
import 'package:flutter_server_flutter/pages/node_detail_page.dart';

class TemperatureNode extends StatelessWidget {
  /// The node to display
  final Node node;

  const TemperatureNode({super.key, required this.node});

  /// Builds a card for each node with its temperature sensors
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final sensors = node.sensors ?? [];

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: minNodeWidth,
        maxWidth: maxNodeWidth,
      ),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NodeDetailPage(node: node),
              ),
            );
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate available width for sensors (subtract card padding)
              final availableWidth =
                  constraints.maxWidth - (nodeCardPadding * 2);

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
                        node.name ?? node.identifier,
                        style: textTheme.headlineLarge,
                      ),
                    ),
                    if (node.description != null) ...[
                      const SizedBox(height: 4),
                      Center(
                        child: Text(
                          node.description!,
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    if (sensors.isEmpty)
                      Text(
                        'No sensors available',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      )
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
      ),
    );
  }
}
