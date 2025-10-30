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
    if (nodes.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text('No temperature data available'),
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
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
