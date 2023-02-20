import 'package:flutter/material.dart';
import 'package:v1/conversation.dart';
import 'message.dart';

class MessageField extends StatelessWidget {
  const MessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      //onSubmitted: (value) => conversationState.addMessageToConversation(
      //  const Message(
      //    message_text: "added message",
      //    sender: true,
      //  ),
      //),
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
    );
  }
}
