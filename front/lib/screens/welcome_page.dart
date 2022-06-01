import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';


Widget welcome(BuildContext context){
  final size = MediaQuery.of(context).size;
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          darkOrange,
          lightRed,
        ],
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, size.height * 0.28 , 0, 0),
          child: Column(
            children: [
              Image.asset(
                "assets/logo_slogan.png",
                width: size.width * 0.75,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
