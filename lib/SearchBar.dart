import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'colors.dart';

Widget SearchBar(){
  return Container(
    margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: const Icon(Icons.search),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            width: 67,
            decoration:  BoxDecoration(
              color: darkRed,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                  bottomLeft: Radius.circular(37),
                  bottomRight: Radius.circular(37)
              ),
              boxShadow: [
                BoxShadow(
                  color: darkYellow.withOpacity(0.35),
                  spreadRadius: 0,
                  blurRadius: 30,
                  offset: const Offset(0, 15), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(""),
            ],
            ),
          ),
        ),
      ],
    ),
  );
}