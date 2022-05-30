import 'package:flutter/material.dart';

import '../widgets/category.dart';
import '../widgets/choice.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.03, size.width * 0.05, 0),
          children: [
            const Text(
              "Categories",
              style: TextStyle(
                  color: Color(0xFF424E5E),
                  fontFamily: "Gilroy",
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Choice(text: "Favourite", ticked: false),
                  Choice(text: "Recent", ticked: false),
                  Choice(text: "Trending", ticked: false),
                  Choice(text: "All", ticked: true)
                ]),
            SizedBox(
              height: size.height * 0.07,
            ),
            Category(
                name: "Painter",
                description:
                    "Does your house need painting?", //Does your house need painting? aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                image: "assets/ice_cream.png",
                isRight: true),
            SizedBox(
              height: size.height * 0.05,
            ),
            Category(
                name: "Petsitter",
                description:
                    "Are you worried about letting your pet alone for a while?",
                image: "assets/corgi.png",
                isRight: true),
            SizedBox(
              height: size.height * 0.05,
            ),
            Category(
                name: "Cameraman",
                description:
                    "Do you have an important event that needs to be immortalized?",
                image: "assets/camera.png",
                isRight: true),
            SizedBox(
              height: size.height * 0.05,
            ),
            Category(
                name: "Caterer",
                description:
                    "Do you need someone to take care of preparing your dinner?",
                image: "assets/cake.png",
                isRight: true),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
