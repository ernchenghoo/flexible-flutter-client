import 'dart:convert';

import 'package:flexible_flutter_client/models/car.dart';
import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';

class LoginService {

  Future<Car> getCarList() async {
    final response = await http.get(Uri.https('localhost:8083', 'cars'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Car.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}