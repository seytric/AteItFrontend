import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MaterialApp(
        title: "AteIt v1",
        home: const MainPage(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );

class Message {
  String messageText;
  bool senderIsMe;
  Message({this.messageText = "", this.senderIsMe = true});
}

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text("Chat"),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "AteIt",
                style: GoogleFonts.abrilFatface(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 45.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(100),
              child: SizedBox(
                height: 200,
                width: 100,
                child: Conversation(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 150, right: 150, top: 50),
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.black,
                  ),
                ),
                cursorColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

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

class LogIn extends StatelessWidget {
  const LogIn({super.key});

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
              padding: const EdgeInsets.only(top: 200),
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
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            const CustomButton(
              "Log In",
              MainPage(),
            ),
          ],
        ),
      ),
    ));
  }
}

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

class CustomButton extends StatelessWidget {
  final String title;
  final Widget goTo; // add this
  const CustomButton(this.title, this.goTo, {super.key}); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 0, 0, 0),
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => goTo));
          },
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
