import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'colors.dart';
import 'SearchBar.dart';

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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 54, 0, 0),
            child: Column(
              children: [
              Image.asset(
                  "assets/logo.png",
                width: 140,
              ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "John Wattson",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/user.png",
                          width: 55,
                          fit: BoxFit.cover,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SearchBar(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SmallCategory("Babysitter","assets/baby.png",darkRed,lightRed),
                SmallCategory("Transporter","assets/truck.png",darkYellow, lightYellow),
                SeeMore(darkYellow, lightYellow),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget SmallCategory(String category, String icon, Color dark, Color light){
  return Stack(
    children: [
      Container(
          //margin: const EdgeInsets.all(10),
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
                color: dark.withOpacity(0.35),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [])
      ),
      Container(
         // margin: const EdgeInsets.all(10),
          // replace with expanded and flex with constant space
          width: 92,
          height: 111,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                dark,
                light,
              ],
            ),
            borderRadius: const BorderRadius.only(
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
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Image.asset(
                  icon,
                  height : 40,
                ),
              ),
              Text(
                category,
                style: const TextStyle(
                  //fontFamily: 'Gilroy',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
      ),
    ],
  );
}


Widget SeeMore(Color dark, Color light){
  return Stack(
    children: [
      Container(
         // margin: const EdgeInsets.all(10),
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
                color: dark.withOpacity(0.35),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [])
      ),
      Container(
       // margin: const EdgeInsets.all(10),
        // replace with expanded and flex with constant space
        width: 92,
        height: 111,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              dark,
              light,
            ],
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "See More",
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                "assets/dots.png",
                height : 15,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


