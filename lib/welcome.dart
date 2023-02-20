import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/custom_button.dart';
import 'package:v1/log_in.dart';
import 'package:v1/sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 37, 129, 124),
            Color.fromARGB(
              255,
              8,
              242,
              255,
            ),
          ],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 225),
              child: Text(
                "AteIt",
                style: GoogleFonts.abrilFatface(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 100.0,
                ),
              ),
            ),
            const CustomButton(
              "Log In",
              LogIn(),
            ),
            const CustomButton(
              "Sign Up",
              SignUp(),
            ),
          ],
        ),
      ),
    ));
  }
}
