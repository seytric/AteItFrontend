import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> logIn(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://ateitbe.azurewebsites.net' '/api/v1/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  return response.body;
}

Future<String> signUp(String email, String username, String password) async {
  final response = await http.post(
    Uri.parse('https://ateitbe.azurewebsites.net' '/api/v1/user/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{'email': email, 'username': username, 'password': password}),
  );

  return response.body;
}

Future<String> sendMessage(String email, String message) async {
  final response = await http.post(
    Uri.parse("https://ateitmessenging.azurewebsites.net/message"),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{'prompt': message, 'email': email}),
  );

  return response.body;
}

Future<String> getProfile(String token) async {
  final response = await http.post(
    Uri.parse('https://ateitbe.azurewebsites.net' '/api/v1/user/token'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{'token': token}),
  );

  return response.body;
}
