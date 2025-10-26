import 'dart:async';

import 'package:serverpod/serverpod.dart';

class TemperatureEndpoint extends Endpoint {
  Future<String> getTemperatures(Session session, String ingredients) async {
    return 'Hello WOrld: $ingredients';
  }
}
