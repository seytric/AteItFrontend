import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Color.fromARGB(207, 38, 38, 38),
      body: Stack(
        children: [
          Container(
            width: 2000,
            height: 60,
            decoration: BoxDecoration(color: Color.fromARGB(54, 0, 0, 0)),
            child: Center(
              child: Text(
                "AteIt",
                style: GoogleFonts.abrilFatface(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 65, left: 20, right: 20),
            child: SizedBox(
              height: height * 0.72,
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
                style: const TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
                controller: fieldController,
                onSubmitted: (value) {
                  addMessageToConversation(
                    Message(
                      message_text: value,
                      sender: messages.length % 2 == 0 ? true : false,
                    ),
                  );
                  fieldController.clear();
                },
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 4, 4, 4), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(152, 0, 0, 0), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  suffixIcon: Icon(
                    Icons.send_sharp,
                    color: Colors.black,
                  ),
                ),
                cursorColor: const Color.fromARGB(85, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
