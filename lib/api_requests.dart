import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> logIn(String email, String password) {
  return http.post(
    Uri.parse('http://localhost:8080/api/v1' '/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );
}

Future<http.Response> signUp(String username, String email, String password) {
  return http.post(
    Uri.parse('http://localhost:8080/api/v1' '/user/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'username': username, 'email': email, 'password': password}),
  );
}

Future<LogInObject> getLogIn(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/api/v1' '/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return LogInObject.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class LogInObject {
  final String username;
  final String email;
  final String password;
  final String messages;
  final String id;
  final String createdAt;
  final String updatedAt;
  final String v;

  const LogInObject(
      {required this.username,
      required this.email,
      required this.password,
      required this.messages,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.v});

  factory LogInObject.fromJson(Map<String, dynamic> json) {
    return LogInObject(
      username: json['user/username'],
      email: json['user/email'],
      password: json['user/password'],
      messages: json['user/messages'],
      id: json['user/_id'],
      createdAt: json['user/createdAt'],
      updatedAt: json['user/updatedAt'],
      v: json['user/__v'],
    );
  }
}

// https://docs.flutter.dev/cookbook/networking/send-data#1-add-the-http-package