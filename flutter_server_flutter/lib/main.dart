import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
late final Client client;

late String serverUrl;

void main() {
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
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Serverpod Example'),
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
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
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

    if (_temperatureData == null || _temperatureData!.isEmpty) {
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
        const Text(
          'Latest Temperature Data',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ..._temperatureData!.map((node) => _buildNodeCard(node)).toList(),
      ],
    );
  }

  /// Builds a card for each node with its temperature sensors
  Widget _buildNodeCard(Node node) {
    final sensors = node.sensors ?? [];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Node: ${node.name ?? node.identifier}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              ...sensors.map((sensor) => _buildSensorRow(sensor)).toList(),
          ],
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
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

/// ResultDisplays shows the result of the call. Either the returned result
/// from the `example.greeting` endpoint method or an error message.
class ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const ResultDisplay({super.key, this.resultMessage, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: Container(
        color: backgroundColor,
        child: Center(child: Text(text)),
      ),
    );
  }
}
