import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:servini_app/screens/add_page.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/screens/profile_page.dart';
import '../main.dart';
import '../screens/search_page.dart';

Widget homeBar(BuildContext context){

  Map<String, dynamic> payload = Jwt.parseJwt(token);
  final size = MediaQuery.of(context).size;
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
         Expanded(
          flex : 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (
                    context) => const SearchPage()),
              );
            },
            child: const Icon(
              Icons.home,
              color: bubbleWhite,
            ),
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

            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(username: payload["username"])),
                );
              },
              child: const Icon(
                  Icons.person,
                  color: Colors.white),
            ),

          ),
        )
      ],
    ),
  );
}