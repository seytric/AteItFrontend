import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:v1/api_requests.dart';
import 'package:v1/log_in.dart';
import 'package:v1/main_page.dart';
import 'package:v1/sign_up.dart';
import 'package:v1/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v1/api_requests.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var jwt = prefs.getString("jwt");

  if (jwt != null) {
    final response = await http.post(
      Uri.parse('https://ateitbe.azurewebsites.net' '/api/v1/user/token'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{'token': jwt}),
    );

    if (json.decode(response.body).containsKey("error")) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("jwt");
    }
  }

  jwt = prefs.getString("jwt");

  runApp(
    MaterialApp(
      title: "AteIt v1",
      home: jwt == null
          ? const Welcome()
          : MainPage(
              jwt: jwt,
              conversation: [],
            ),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    ),
  );
}
