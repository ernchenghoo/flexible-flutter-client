import 'dart:convert';

import 'package:flexible_flutter_client/models/login_resposne.dart';
import 'package:flexible_flutter_client/network/api_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  //
  // Future<http.Response> createAlbum(String title) {
  //   return http.post(
  //     Uri.https('jsonplaceholder.typicode.com', 'albums'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //     }),
  //   );
  // }

  Future<bool> login(String email, String password) async {

    Client client = HttpClientWithInterceptor.build(interceptors: [
      APIInterceptor(),
    ]);

    final response = await client.post(
      Uri.http('192.168.0.147:8083', 'authentication/login'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      LoginResponse loginResponse =  LoginResponse.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', loginResponse.authorization);
      await prefs.setString('email', loginResponse.email);

      return true;
    } else {
      return false;
    }
  }
}