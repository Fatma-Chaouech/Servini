import 'package:flutter/material.dart';
import 'package:servini_app/colors.dart';
import 'package:servini_app/profile/person_card.dart';
import 'package:servini_app/home/title_row.dart';
import 'package:servini_app/profile/offer.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(size.height * 0.03,0,size.height * 0.03,0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              const Text(
                "About",
                style: TextStyle(
                  color: writingBlue,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Text("I’m a professional scientist who loves helping others.",
                  style: TextStyle(fontSize: 16, fontFamily: "Gilroy")),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          titleRow("Offers"),
          Offer(
            title: 'Part-time 4th year High School Science tutor',
          ),
          SizedBox(height: size.height * 0.03),
          titleRow("Recommendations"),
          SizedBox(height: size.height * 0.025),
          PersonCard(
              name: "Foulen",
              lastName: "Fouleni",
              description:
                  "Firas is a very professional science tutor. Highly recommend!",
              nbStars: 4.5,
              pic: "assets/user.png"),
          SizedBox(height: size.height * 0.025),
          PersonCard(
              name: "Foulen",
              lastName: "Fouleni",
              description:
                  "Firas is a very professional science tutor. Highly recommend!",
              nbStars: 4,
              pic: "assets/user.png"),
        ],
      ),
    );
  }
}
