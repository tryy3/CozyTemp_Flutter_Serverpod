// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter_server_server/src/generated/protocol.dart';
// import 'package:serverpod/serverpod.dart';

// class APIRoute extends WidgetRoute {
//   @override
//   Future<AbstractWidget> build(Session session, HttpRequest request) async {
//     session.log('API route called: ${request.method} ${request.uri.path}');

//     // Read and parse the request body
//     String bodyString = await utf8.decoder.bind(request).join();
//     session.log('Request body: $bodyString');

//     // Parse JSON if body is not empty
//     CollectData? collectData;
//     if (bodyString.isNotEmpty) {
//       try {
//         collectData = CollectData.fromJson(jsonDecode(bodyString));
//         session.log('Parsed body data: $collectData');
//       } catch (e) {
//         session.log('Error parsing JSON: $e', level: LogLevel.error);
//         return WidgetJson(
//           object: {'error': 'Invalid JSON in request body'},
//         );
//       }
//     }

//     // Example: Use the parsed data to create a response
//     // If bodyData contains the expected fields, use them; otherwise use test data
//     try {
//       final collectData = CollectData(
//         nodeIdentifier: 'test',
//         data: [
//           CollectDataTemperature(sensorIdentifier: 'test', temperature: 20.0)
//         ],
//       );

//       return WidgetJson(object: collectData);
//     } catch (e) {
//       session.log('Error creating CollectData: $e', level: LogLevel.error);
//       return WidgetJson(
//         object: {'error': 'Invalid data format', 'details': e.toString()},
//       );
//     }
//   }
// }
