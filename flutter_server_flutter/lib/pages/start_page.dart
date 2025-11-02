import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import '../main.dart';
import '../widgets/temperature_nodes_list.dart';
import '../theme/app_theme.dart';

/// The main start page of the application showing the latest temperature data
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  /// Holds the last error message that we've received from the server or null
  /// if no error exists yet.
  String? _errorMessage;

  /// Loading state for temperature data
  bool _isLoading = false;

  /// Holds the latest temperature data
  List<Node>? _temperatureData;

  @override
  void initState() {
    super.initState();
    _loadTemperatureData();
  }

  /// Loads the latest temperature data from the server
  Future<void> _loadTemperatureData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final data = await client.temperature.latestTemperatureData();

      setState(() {
        _temperatureData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load temperature data: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CozyTemp')),
      body: RefreshIndicator(
        onRefresh: _loadTemperatureData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildTemperatureDataSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFloatingMenu(),
    );
  }

  /// Builds a floating action button with a menu for actions
  Widget _buildFloatingMenu() {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'refresh':
            _loadTemperatureData();
          case 'theme':
            themeController.toggleTheme();
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'refresh',
          child: Row(
            children: [
              Icon(Icons.refresh),
              SizedBox(width: 12),
              Text('Refresh'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'theme',
          child: Row(
            children: [
              Icon(themeController.themeModeIcon),
              SizedBox(width: 12),
              Text('Theme: ${themeController.themeModeLabel}'),
            ],
          ),
        ),
      ],
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Actions',
        child: const Icon(Icons.more_vert),
      ),
    );
  }

  /// Builds the temperature data section with loading states
  Widget _buildTemperatureDataSection() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_errorMessage != null && _temperatureData == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadTemperatureData,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_temperatureData == null) {
      return const SizedBox.shrink();
    }

    return TemperatureNodesList(
      nodes: _temperatureData!,
    );
  }
}

/// ResultDisplays shows the result of the call. Either the returned result
/// from the `example.greeting` endpoint method or an error message.
class ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const ResultDisplay({super.key, this.resultMessage, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final tempColors = theme.extension<TemperatureColors>();

    String text;
    Color backgroundColor;
    Color textColor;

    if (errorMessage != null) {
      backgroundColor = colorScheme.errorContainer;
      textColor = colorScheme.onErrorContainer;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = tempColors?.success?.withValues(alpha: 0.2) ??
          colorScheme.primaryContainer;
      textColor = tempColors?.success ?? colorScheme.onPrimaryContainer;
      text = resultMessage!;
    } else {
      backgroundColor = colorScheme.surfaceContainerHighest;
      textColor = colorScheme.onSurface.withValues(alpha: 0.6);
      text = 'No server response yet.';
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
