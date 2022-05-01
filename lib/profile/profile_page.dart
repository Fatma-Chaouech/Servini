import 'package:flutter/material.dart';
import 'package:servini_app/profile/profile_body.dart';
import 'package:servini_app/profile/top_part.dart';
import '../colors.dart';
import 'heart_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _MyProfilePage();
}

//te5edh objet profile mel base
class _MyProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: coldBackground,
          body: ListView(children: [
            topPart(context, 3.5),
            ProfileBody()
          ])),
    );
  }
}
