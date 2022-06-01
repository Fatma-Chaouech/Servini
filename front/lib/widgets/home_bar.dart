import 'package:flutter/material.dart';
import 'package:servini_app/screens/add_page.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/screens/messaging_page.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../app.dart';

Widget homeBar(BuildContext context){
  final size = MediaQuery.of(context).size;
  final client = StreamChatClient(streamKey);

  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          darkOrange,
          lightOrange,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Row(
      children: [
        const Expanded(
          flex : 2,
          child: Icon(
            Icons.home,
            color: bubbleWhite,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: size.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                  BoxShadow(
                  color: bubbleWhite.withOpacity(0.5),
                ),
                BoxShadow(
                color: darkOrange.withOpacity(0.3),
                spreadRadius: -10,
                blurRadius: 4,
              ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPage()),
                );
              },
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(
                    color: bubbleWhite,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagingPage(client:client)),
                );
              },
            child: Icon(
                Icons.message_outlined ,
                color: bubbleWhite,
            ),
          ),
        )
      ],
    ),
  );
}