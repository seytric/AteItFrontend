import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/api_requests.dart';
import 'dart:convert';
import 'message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final String jwt;
  const MainPage({super.key, required this.jwt});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final fieldController = TextEditingController();
  final scrollController = ScrollController();

  List<Message> messages = [];
  String prompt = "";
  String email = "";

  void setEmail() async {
    String response = await getProfile(widget.jwt);
    email = jsonDecode(response)['user']['email'];
  }

  void addMessageToConversation(Message message) {
    setState(() {
      messages.add(message);
    });
  }

  void getResponse(String message) async {
    print(email);
    String response = await sendMessage(email, message);
    var json_response_object = jsonDecode(response);
    String response_message = json_response_object['response']['content'];

    setState(() {
      messages.add(Message(message_text: response_message, sender: false));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(
        milliseconds: 100,
      ),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (email == "") {
      setEmail();
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(207, 38, 38, 38),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(color: Color.fromARGB(54, 0, 0, 0)),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "AteIt",
                    style: GoogleFonts.abrilFatface(fontSize: 40, color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.account_box,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 20, right: 20),
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
                      sender: true,
                    ),
                  );
                  getResponse(value);
                  fieldController.clear();
                  WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
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
