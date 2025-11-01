/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:flutter_server_client/src/protocol/greeting.dart' as _i3;
import 'package:flutter_server_client/src/protocol/temperature/models/collect_data.dart'
    as _i4;
import 'package:flutter_server_client/src/protocol/temperature/models/node.dart'
    as _i5;
import 'package:flutter_server_client/src/protocol/temperature/models/sensor.dart'
    as _i6;
import 'package:flutter_server_client/src/protocol/temperature/models/raw_data.dart'
    as _i7;
import 'package:flutter_server_client/src/protocol/temperature/models/calibration_input.dart'
    as _i8;
import 'protocol.dart' as _i9;

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i3.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i3.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTemperature extends _i1.EndpointRef {
  EndpointTemperature(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'temperature';

  _i2.Future<String> getTemperatures(String ingredients) =>
      caller.callServerEndpoint<String>(
        'temperature',
        'getTemperatures',
        {'ingredients': ingredients},
      );

  _i2.Future<void> collectData(_i4.CollectData collectData) =>
      caller.callServerEndpoint<void>(
        'temperature',
        'collectData',
        {'collectData': collectData},
      );

  _i2.Future<List<_i5.Node>> latestTemperatureData() =>
      caller.callServerEndpoint<List<_i5.Node>>(
        'temperature',
        'latestTemperatureData',
        {},
      );

  /// Fetches historical temperature data for a specific node with aggregation
  /// [nodeId] - The UUID of the node to fetch data for
  /// [timeRange] - Time range filter: "24h", "7d", or "all"
  ///
  /// Data is aggregated into time buckets to optimize performance:
  /// - 24h: 5-minute intervals (~288 points per sensor)
  /// - 7d: 1-hour intervals (~168 points per sensor)
  /// - all: 1-day intervals
  _i2.Future<_i5.Node?> getNodeHistoricalData(
    String nodeId,
    String timeRange,
  ) =>
      caller.callServerEndpoint<_i5.Node?>(
        'temperature',
        'getNodeHistoricalData',
        {
          'nodeId': nodeId,
          'timeRange': timeRange,
        },
      );

  /// Updates a node's name and/or description
  /// Returns the updated node or null if not found
  _i2.Future<_i5.Node?> updateNode(
    String nodeId,
    String? name,
    String? description,
  ) =>
      caller.callServerEndpoint<_i5.Node?>(
        'temperature',
        'updateNode',
        {
          'nodeId': nodeId,
          'name': name,
          'description': description,
        },
      );

  /// Updates a sensor's name and/or description
  /// Returns the updated sensor or null if not found
  _i2.Future<_i6.Sensor?> updateSensor(
    String sensorId,
    String? name,
    String? description,
  ) =>
      caller.callServerEndpoint<_i6.Sensor?>(
        'temperature',
        'updateSensor',
        {
          'sensorId': sensorId,
          'name': name,
          'description': description,
        },
      );

  /// Fetches uncalibrated raw temperature data
  /// [limit] - Maximum number of records to return
  /// Returns the newest uncalibrated data points first
  _i2.Future<List<_i7.RawData>> getUncalibratedData(int limit) =>
      caller.callServerEndpoint<List<_i7.RawData>>(
        'temperature',
        'getUncalibratedData',
        {'limit': limit},
      );

  /// Creates calibrated temperature readings for multiple raw data points (bulk insert)
  /// [calibrations] - List of CalibrationInput containing rawDataId and temperature
  /// Returns true on success
  ///
  /// Uses Serverpod's built-in batch insert which is atomic (all-or-nothing).
  /// PostgreSQL constraints will enforce:
  /// - Foreign key constraint ensures rawDataId exists in raw_data table
  /// - Unique constraint on rawDataId prevents duplicate calibrations
  /// If any constraint is violated, the entire operation fails and an error is thrown
  _i2.Future<bool> createCalibratedTemperature(
          List<_i8.CalibrationInput> calibrations) =>
      caller.callServerEndpoint<bool>(
        'temperature',
        'createCalibratedTemperature',
        {'calibrations': calibrations},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    greeting = EndpointGreeting(this);
    temperature = EndpointTemperature(this);
  }

  late final EndpointGreeting greeting;

  late final EndpointTemperature temperature;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'greeting': greeting,
        'temperature': temperature,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
