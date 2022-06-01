import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/widgets/bubble_button.dart';
import 'package:servini_app/screens/msging/widgets.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../app.dart';
import '../helpers.dart';
import 'msging/messages.dart';
class MessagingPage extends StatefulWidget {
  final client = StreamChatClient(streamKey);
  MessagingPage({Key? key, required client}) : super(key: key);
  @override
  State<MessagingPage> createState() => _MyMessagingPage();
}

class _MyMessagingPage extends State<MessagingPage> {
  final gradient = const LinearGradient(
      colors: [darkRed, darkOrange],
      begin: Alignment.centerLeft,
      end: Alignment.center
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor:Colors.transparent,
        elevation: 0,
        title: Text(
          'Messages',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color:Colors.black,
          )
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: () {
              print('TODO search');
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            //child: Text("helloo"),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          ),
        ],
      ),
      body: Center(
        child: Messages(),
      )
    );
  }



}