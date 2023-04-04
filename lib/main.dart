import 'package:flutter/material.dart';
import 'package:v1/api_requests.dart';
import 'package:v1/log_in.dart';
import 'package:v1/main_page.dart';
import 'package:v1/sign_up.dart';
import 'package:v1/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var jwt = prefs.getString("jwt");

  runApp(
    MaterialApp(
      title: "AteIt v1",
      home: jwt == null ? const Welcome() : MainPage(jwt: jwt),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    ),
  );
}
