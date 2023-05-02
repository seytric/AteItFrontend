import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/api_requests.dart';
import 'package:v1/recipe_book.dart';
import 'package:v1/welcome.dart';
import 'dart:convert';
import 'message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final String jwt;
  final List<Message> conversation;
  const MainPage({super.key, required this.jwt, required this.conversation});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final fieldController = TextEditingController();
  final scrollController = ScrollController();

  List<Message> messages = [];
  String prompt = "";
  String email = "";

  bool loading = false;

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
    print(response);
    var json_response_object = jsonDecode(response);
    String response_message = json_response_object.containsKey("response")
        ? json_response_object['response']['content']
        : "Error - our servers are temporarily down. Try again shortly";
    loading = false;

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

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("jwt");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  }

  void goToRecipes() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecipeBook(
                jwt: widget.jwt,
                email: email,
                conversation: messages,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    messages.addAll(widget.conversation);
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
                Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                        minWidth: 5,
                        child: const Icon(
                          Icons.logout_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () => logOut()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 7),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                        minWidth: 5,
                        child: const Icon(
                          Icons.menu_book_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () => goToRecipes()),
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
          loading
              ? const Align(
                  alignment: FractionalOffset(0.5, 0.92),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(195, 52, 190, 232),
                      backgroundColor: Color.fromARGB(133, 12, 46, 197),
                      strokeWidth: 5.0,
                    ),
                  ),
                )
              : Align(
                  alignment: const FractionalOffset(0.5, 0.9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 200),
                    child: TextField(
                      style: const TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
                      controller: fieldController,
                      onSubmitted: (value) {
                        loading = true;
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
