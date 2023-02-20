// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message_text;
  final bool sender;

  const Message({
    super.key,
    required this.message_text,
    required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    if (sender) {
      return Container(
        width: 600,
        height: 50,
        decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
        child: Center(
          child: Text(message_text),
        ),
      );
    } else {
      return Container(
        width: 600,
        height: 50,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 5)),
        child: Center(
          child: Text(message_text),
        ),
      );
    }
  }
}
