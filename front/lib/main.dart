import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:servini_app/screens/search_page.dart';
import 'package:servini_app/screens/sign_up_page.dart';
import 'package:servini_app/screens/welcome_page.dart';
import 'dart:async';

var token = "" ;

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = 2;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PageView(
        children: [welcome(context), SignUpPage()],
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          }
          );
        }
      );
  }

}
