import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmallCategory("Babysitter","assets/baby.png"),
    );
  }
}

Widget SmallCategory(String category, String icon){
  return Stack(
    children: [
      Container(
          margin: const EdgeInsets.all(50),
          // replace with expanded and flex with constant space
          width: 78,
          height: 111,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
            ),
            boxShadow: [
              BoxShadow(
                color: darkRed.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [])
      ),
      Container(
          margin: const EdgeInsets.all(50),
          // replace with expanded and flex with constant space
          width: 92,
          height: 111,
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                darkRed,
                lightRed,
              ],
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  icon,
                  height : 40,
                ),
              ),
              Text(
                category,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
      ),
    ],
  );
}

