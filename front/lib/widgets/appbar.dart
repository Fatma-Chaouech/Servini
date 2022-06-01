
import 'package:flutter/material.dart';
import 'package:servini_app/screens/sign_in_page.dart';

Widget customAppBar(context){
  final size = MediaQuery.of(context).size;
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (c) => SignInPage()),
                  (route) => false);},
          child: const Icon(Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB( size.width * 0.25, 0, 0, 0),
        child: Image.asset(
        "assets/logo.png",
        width: 120,
        fit: BoxFit.fitWidth,
    ),
      ),
    ],
  );
}



