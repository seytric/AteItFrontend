import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/log_in.dart';
import 'api_requests.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Widget goTo; // add this
  const CustomButton(this.title, this.goTo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(207, 43, 43, 43),
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.abrilFatface(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
