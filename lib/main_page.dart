import 'package:flutter/material.dart';

import 'message.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final fieldController = TextEditingController();
  final scrollController = ScrollController();

  List<Message> messages = [];

  void addMessageToConversation(Message message) {
    setState(() {
      messages.add(message);
    });
    scrollController.animateTo(scrollController.position.maxScrollExtent, curve: Curves.ease, duration: const Duration(milliseconds: 250));
  }

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
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return messages[index];
                },
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: TextField(
                controller: fieldController,
                onSubmitted: (value) {
                  addMessageToConversation(
                    Message(
                      message_text: value,
                      sender: value.length > 8 ? true : false,
                    ),
                  );
                  fieldController.clear();
                },
                autocorrect: true,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
