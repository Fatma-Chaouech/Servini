import 'package:flutter/material.dart';
import 'package:servini_app/profile/top_part.dart';
import '../colors.dart';
import 'heart_button.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _MyProfilePage();
}

class _MyProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: coldBackground,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              topPart(context, 3.5),
              Positioned(
                top: size.height * 0.44,
                left: size.width * 0.385,
                child: heartButton(context),
              ),
            ],
          ),
        ),
      ),
    );

  }
}