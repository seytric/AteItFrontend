import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/custom_button.dart';
import 'package:v1/main_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 34, 114, 110),
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
              padding: const EdgeInsets.only(top: 175),
              child: Text(
                "AteIt",
                style: GoogleFonts.abrilFatface(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 100.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'Create password',
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                ),
                obscureText: true,
              ),
            ),
            const CustomButton(
              "Sign Up",
              MainPage(),
            ),
          ],
        ),
      ),
    ));
  }
}
