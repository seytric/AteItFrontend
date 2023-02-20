import 'package:flutter/material.dart';
import 'package:v1/message.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => ConversationState();
}

class ConversationState extends State<Conversation> {
  List<Message> messages = [const Message(message_text: "message1", sender: false), const Message(message_text: "message2", sender: true)];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: messages,
    );
  }

  void addMessageToConversation(Message message) {
    setState(() {
      messages.add(message);
    });
  }
}
