import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> logIn(String email, String password) {
  return http.post(
    Uri.parse('https://placerholder.com' '/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'title': email, 'password': password}),
  );
}

Future<http.Response> signUp(String email, String password) {
  return http.post(
    Uri.parse('https://placerholder.com' '/user/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );
}

// https://docs.flutter.dev/cookbook/networking/send-data#1-add-the-http-package