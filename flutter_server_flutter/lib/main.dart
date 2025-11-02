import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'widgets/temperature_nodes_list.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
late final Client client;

late String serverUrl;

/// Global theme controller
final themeController = ThemeController();

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize theme controller
  await themeController.initialize();

  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl =
      serverUrlFromEnv.isEmpty ? 'http://$localhost:8080/' : serverUrlFromEnv;

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'CozyTemp',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          home: const MyHomePage(title: 'CozyTemp'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  /// Holds the last result or null if no result exists yet.
  String? _resultMessage;

  /// Holds the last error message that we've received from the server or null
  /// if no error exists yet.
  String? _errorMessage;

  final _textEditingController = TextEditingController();

  /// Loading state for temperature data
  bool _isLoading = false;

  /// Holds the latest temperature data
  List<Node>? _temperatureData;

  @override
  void initState() {
    super.initState();
    _loadTemperatureData();
  }

  /// Calls the `hello` method of the `greeting` endpoint. Will set either the
  /// `_resultMessage` or `_errorMessage` field, depending on if the call
  /// is successful.
  void _callHello() async {
    try {
      //final result = await client.greeting.hello(_textEditingController.text);
      final result =
          await client.temperature.getTemperatures(_textEditingController.text);
      setState(() {
        _errorMessage = null;
        _resultMessage = result;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  void _collectDataTest() async {
    try {
      await client.temperature.collectData(
        CollectData(
          nodeIdentifier: 'test',
          data: [
            CollectDataTemperature(
              sensorIdentifier: 'test',
              temperature: 20.0,
            ),
            CollectDataTemperature(
              sensorIdentifier: 'test2',
              temperature: 21.0,
            ),
          ],
        ),
      );
      setState(() {
        _errorMessage = null;
        _resultMessage = 'Data collected';
      });
      // Refresh temperature data to show the new data
      await _loadTemperatureData();
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
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
      appBar: AppBar(title: Text(widget.title)),
      body: RefreshIndicator(
        onRefresh: _loadTemperatureData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextField(
                    controller: _textEditingController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your name'),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        onPressed: _callHello,
                        child: const Text('Send to Server'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        onPressed: _collectDataTest,
                        child: const Text('Collect Data Test'),
                      ),
                    ),
                  ],
                ),
                ResultDisplay(
                  resultMessage: _resultMessage,
                  errorMessage: _errorMessage,
                ),
                const SizedBox(height: 24),
                _buildTemperatureDataSection(),
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
      title: 'Latest Temperature Data',
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
