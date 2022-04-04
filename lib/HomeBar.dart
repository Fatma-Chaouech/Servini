import 'package:flutter/material.dart';
import 'colors.dart';

Widget HomeBar(){
  return Container(
    width: 69,
    height: 20,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          darkOrange,
          lightOrange,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(24))
    ),
    child: Container(
      child: Row(
        children: [
          Container(
            child: const Icon(
              Icons.home,
              color: bubbleWhite,
            ),
            margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          ),
          const SizedBox(width: 45),
          Container(
            width: 55,
            height: 50,
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
          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: const Icon(
                Icons.person,
                color: bubbleWhite,
            ),
          )
        ],
      ),
    ),
  );
}