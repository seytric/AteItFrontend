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
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: 600,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(132, 57, 201, 245),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: const Icon(
                      Icons.person,
                      color: Color.fromARGB(165, 57, 201, 245),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: Center(
                  child: Text(
                    message_text,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: 600,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(133, 12, 46, 197),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: const Icon(
                      Icons.hive,
                      color: Color.fromARGB(170, 12, 46, 197),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: Center(
                  child: Text(
                    message_text,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
