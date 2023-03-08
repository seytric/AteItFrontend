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
        color: Color.fromARGB(207, 38, 38, 38),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 190),
              child: Text(
                "AteIt",
                style: GoogleFonts.abrilFatface(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 100.0,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Padding(
              //button
              padding: const EdgeInsets.only(top: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(207, 43, 43, 43),
                child: MaterialButton(
                  minWidth: 250,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  child: Text(
                    "Log In",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alata(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              //button
              padding: const EdgeInsets.only(top: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(207, 43, 43, 43),
                child: MaterialButton(
                  minWidth: 250,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alata(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
