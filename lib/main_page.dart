import 'package:flutter/material.dart';
import 'package:v1/conversation.dart';
import 'package:v1/message_field.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: height * 0.05),
            child: SizedBox(
              height: height * 0.7,
              child: const Conversation(),
            ),
          ),
          const Align(
            alignment: FractionalOffset(0.5, 0.9),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 200),
              child: MessageField(),
            ),
          ),
        ],
      ),
    );
  }
}
