import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/main.dart';
import 'package:flutter_server_flutter/widgets/temperature_chart.dart';
import 'package:flutter_server_flutter/widgets/edit_dialog.dart';

/// Detail page for a specific node showing historical temperature data
class NodeDetailPage extends StatefulWidget {
  final Node node;

  const NodeDetailPage({super.key, required this.node});

  @override
  State<NodeDetailPage> createState() => _NodeDetailPageState();
}

class _NodeDetailPageState extends State<NodeDetailPage> {
  /// Current node with historical data
  Node? _nodeWithHistory;

  /// Loading state
  bool _isLoading = false;

  /// Error message
  String? _errorMessage;

  /// Selected time range
  String _selectedTimeRange = '24h';

  /// Time range options
  final Map<String, String> _timeRangeOptions = {
    '24h': 'Last 24 Hours',
    '7d': 'Last 7 Days',
    'all': 'All Time',
  };

  @override
  void initState() {
    super.initState();
    _loadHistoricalData();
  }

  /// Loads historical temperature data for the node
  Future<void> _loadHistoricalData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final nodeId = widget.node.id?.uuid;
      if (nodeId == null) {
        throw Exception('Node ID is null');
      }

      final node = await client.temperature.getNodeHistoricalData(
        nodeId,
        _selectedTimeRange,
      );

      if (node == null) {
        throw Exception('Node not found');
      }

      setState(() {
        _nodeWithHistory = node;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load temperature data: $e';
        _isLoading = false;
      });
    }
  }

  /// Shows edit dialog for the node
  Future<void> _editNode() async {
    final result = await EditDialog.show(
      context: context,
      title: 'Edit Node',
      initialName: _nodeWithHistory?.name,
      initialDescription: _nodeWithHistory?.description,
      nameLabel: 'Node Name',
      descriptionLabel: 'Node Description',
    );

    if (result != null) {
      await _updateNode(result.name, result.description);
    }
  }

  /// Updates the node on the server
  Future<void> _updateNode(String? name, String? description) async {
    try {
      final nodeId = widget.node.id?.uuid;
      if (nodeId == null) {
        throw Exception('Node ID is null');
      }

      final updatedNode = await client.temperature.updateNode(
        nodeId,
        name,
        description,
      );

      if (updatedNode != null) {
        setState(() {
          _nodeWithHistory = _nodeWithHistory?.copyWith(
            name: updatedNode.name,
            description: updatedNode.description,
          );
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Node updated successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update node: $e')),
        );
      }
    }
  }

  /// Shows edit dialog for a sensor
  Future<void> _editSensor(Sensor sensor) async {
    final result = await EditDialog.show(
      context: context,
      title: 'Edit Sensor',
      initialName: sensor.name,
      initialDescription: sensor.description,
      nameLabel: 'Sensor Name',
      descriptionLabel: 'Sensor Description',
    );

    if (result != null) {
      await _updateSensor(sensor, result.name, result.description);
    }
  }

  /// Updates a sensor on the server
  Future<void> _updateSensor(
    Sensor sensor,
    String? name,
    String? description,
  ) async {
    try {
      final sensorId = sensor.id?.uuid;
      if (sensorId == null) {
        throw Exception('Sensor ID is null');
      }

      final updatedSensor = await client.temperature.updateSensor(
        sensorId,
        name,
        description,
      );

      if (updatedSensor != null) {
        setState(() {
          // Update the sensor in the node's sensor list
          final sensors = _nodeWithHistory?.sensors ?? [];
          final index = sensors.indexWhere((s) => s.id == sensor.id);
          if (index != -1) {
            sensors[index] = sensors[index].copyWith(
              name: updatedSensor.name,
              description: updatedSensor.description,
            );
          }
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sensor updated successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update sensor: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = _nodeWithHistory ?? widget.node;

    return Scaffold(
      appBar: AppBar(
        title: Text(node.name ?? node.identifier),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editNode,
            tooltip: 'Edit Node',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadHistoricalData,
        child: _buildBody(node),
      ),
    );
  }

  Widget _buildBody(Node node) {
    if (_isLoading && _nodeWithHistory == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null && _nodeWithHistory == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadHistoricalData,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final sensors = node.sensors ?? [];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Node information card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            node.name ?? node.identifier,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          if (node.name != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              'ID: ${node.identifier}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: _editNode,
                      tooltip: 'Edit Node',
                    ),
                  ],
                ),
                if (node.description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    node.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
                const SizedBox(height: 16),
                Text(
                  'Sensors: ${sensors.length}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Time range selector
        Row(
          children: [
            Text(
              'Time Range:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButton<String>(
                value: _selectedTimeRange,
                isExpanded: true,
                items: _timeRangeOptions.entries
                    .map((entry) => DropdownMenuItem(
                          value: entry.key,
                          child: Text(entry.value),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null && value != _selectedTimeRange) {
                    setState(() {
                      _selectedTimeRange = value;
                    });
                    _loadHistoricalData();
                  }
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Temperature charts for each sensor
        if (_isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          )
        else if (sensors.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  'No sensors available',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                ),
              ),
            ),
          )
        else
          ...sensors.map((sensor) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TemperatureChart(
                            sensor: sensor,
                            timeRange: _selectedTimeRange,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () => _editSensor(sensor),
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text('Edit Sensor'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
      ],
    );
  }
}
