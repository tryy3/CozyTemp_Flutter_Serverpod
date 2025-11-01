/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../greeting_endpoint.dart' as _i2;
import '../temperature/temperature_endpoint.dart' as _i3;
import 'package:flutter_server_server/src/generated/temperature/models/collect_data.dart'
    as _i4;
import 'package:flutter_server_server/src/generated/temperature/models/calibration_input.dart'
    as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'greeting': _i2.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'temperature': _i3.TemperatureEndpoint()
        ..initialize(
          server,
          'temperature',
          null,
        ),
    };
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i2.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['temperature'] = _i1.EndpointConnector(
      name: 'temperature',
      endpoint: endpoints['temperature']!,
      methodConnectors: {
        'getTemperatures': _i1.MethodConnector(
          name: 'getTemperatures',
          params: {
            'ingredients': _i1.ParameterDescription(
              name: 'ingredients',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint)
                  .getTemperatures(
            session,
            params['ingredients'],
          ),
        ),
        'collectData': _i1.MethodConnector(
          name: 'collectData',
          params: {
            'collectData': _i1.ParameterDescription(
              name: 'collectData',
              type: _i1.getType<_i4.CollectData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint).collectData(
            session,
            params['collectData'],
          ),
        ),
        'latestTemperatureData': _i1.MethodConnector(
          name: 'latestTemperatureData',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint)
                  .latestTemperatureData(session),
        ),
        'getNodeHistoricalData': _i1.MethodConnector(
          name: 'getNodeHistoricalData',
          params: {
            'nodeId': _i1.ParameterDescription(
              name: 'nodeId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'timeRange': _i1.ParameterDescription(
              name: 'timeRange',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint)
                  .getNodeHistoricalData(
            session,
            params['nodeId'],
            params['timeRange'],
          ),
        ),
        'updateNode': _i1.MethodConnector(
          name: 'updateNode',
          params: {
            'nodeId': _i1.ParameterDescription(
              name: 'nodeId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint).updateNode(
            session,
            params['nodeId'],
            params['name'],
            params['description'],
          ),
        ),
        'updateSensor': _i1.MethodConnector(
          name: 'updateSensor',
          params: {
            'sensorId': _i1.ParameterDescription(
              name: 'sensorId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint)
                  .updateSensor(
            session,
            params['sensorId'],
            params['name'],
            params['description'],
          ),
        ),
        'getUncalibratedData': _i1.MethodConnector(
          name: 'getUncalibratedData',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint)
                  .getUncalibratedData(
            session,
            params['limit'],
          ),
        ),
        'createCalibratedTemperature': _i1.MethodConnector(
          name: 'createCalibratedTemperature',
          params: {
            'calibrations': _i1.ParameterDescription(
              name: 'calibrations',
              type: _i1.getType<List<_i5.CalibrationInput>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['temperature'] as _i3.TemperatureEndpoint)
                  .createCalibratedTemperature(
            session,
            params['calibrations'],
          ),
        ),
      },
    );
  }
}
