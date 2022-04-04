import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servini_app/SearchPage.dart';
import 'colors.dart';


void main() {
  runApp(const MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
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
        body: Container(
          margin: const EdgeInsets.fromLTRB(95, 250 , 0, 0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Image.asset(
                  "assets/logo_white.png",
                  width: 196,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Small Jobs, Big Impacts",
                style: TextStyle(
                  fontFamily: "GilroySemiBold",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 250),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                },
                child: BubbleButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget BubbleButton(){
  return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 49,
      width: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: bubbleWhite.withOpacity(0.5),
          ),
          BoxShadow(
            color: darkRed.withOpacity(0.3),
            spreadRadius: -10,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: const [
          Text(
            "Let's Go!",
            style: TextStyle(
              fontSize: 20,
              color: bubbleWhite,
              fontFamily: "GilroySemiBold",
            ),
          ),
        ],
      )
  );
}