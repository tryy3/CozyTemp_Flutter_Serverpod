import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_node.dart';
import 'package:flutter_server_flutter/widgets/temperature_layout_constants.dart';

/// A widget that displays a list of temperature nodes with their sensors
class TemperatureNodesList extends StatelessWidget {
  /// The list of nodes to display
  final List<Node> nodes;

  /// Optional title to display above the list
  final String? title;

  const TemperatureNodesList({
    super.key,
    required this.nodes,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    if (nodes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'No temperature data available',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Center(
            child: Text(
              title!,
              style: textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 16),
        ],
        Wrap(
          spacing: sensorSpacing,
          runSpacing: sensorRunSpacing,
          children: nodes.map((node) => TemperatureNode(node: node)).toList(),
        ),
      ],
    );
  }
}
