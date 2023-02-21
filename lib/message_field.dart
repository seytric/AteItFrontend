import 'package:flutter/material.dart';
import 'message.dart';

class MessageField extends StatelessWidget {
  const MessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onSubmitted: (value) => archive.addMessageToConversation(
      //   Message(
      //     message_text: value,
      //     sender: true,
      //   ),
      // ),
      autocorrect: false,
      decoration: const InputDecoration(
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
    );
  }
}
