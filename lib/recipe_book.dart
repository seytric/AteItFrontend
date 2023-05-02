import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/main_page.dart';

import 'api_requests.dart';
import 'message.dart';

class RecipeBook extends StatefulWidget {
  final String jwt;
  final String email;
  final List<Message> conversation;

  const RecipeBook({super.key, required this.jwt, required this.email, required this.conversation});

  @override
  State<RecipeBook> createState() => _RecipeBookState();
}

void pass() {}

class _RecipeBookState extends State<RecipeBook> {
  List<Recipe> card_list = [];

  void getCards() async {
    String response = await getRecipes(widget.email);
    List<dynamic> recipes = jsonDecode(response);

    print(recipes);

    setState(() {
      for (var recipe in recipes) {
        int color_hex = int.parse(recipe['color'].substring(1), radix: 16) + 0xFF000000;
        card_list.add(
          Recipe(
            title: recipe['name'],
            ingredients: recipe['ingredients'],
            instructions: recipe['instructions'],
            color: Color(color_hex),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCards();
  }

  @override
  Widget build(BuildContext context) {
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
                        Icons.chat,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(
                                  jwt: widget.jwt,
                                  conversation: widget.conversation,
                                )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 65),
            child: ListView.builder(
              itemCount: card_list.length,
              itemBuilder: (context, index) {
                return card_list[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe extends StatefulWidget {
  final String title;
  final String ingredients;
  final String instructions;
  final Color color;

  Recipe({required this.title, required this.ingredients, required this.instructions, required this.color});

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.title,
              style: GoogleFonts.nunito(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.white,
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    widget.ingredients,
                    style: GoogleFonts.nunito(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.instructions,
                    style: GoogleFonts.nunito(textStyle: const TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
