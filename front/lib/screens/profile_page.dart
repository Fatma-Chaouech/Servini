import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:servini_app/widgets/home_bar.dart';
import 'package:servini_app/widgets/profile_body.dart';
import 'package:servini_app/widgets/top_part.dart';
import 'package:servini_app/constants/colors.dart';

import '../main.dart';

class ProfilePage extends StatefulWidget {
  String username;
  ProfilePage({Key? key,required this.username}) : super(key: key);
  @override
  State<ProfilePage> createState() => _MyProfilePage();
}

//te5edh objet profile mel base
class _MyProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    return SafeArea(
      child: Scaffold(
          backgroundColor: coldBackground,
          body: Stack(
            children: [
              ListView(children: [
                topPart(context,payload['username']),
                ProfileBody( username: payload['username']),
                SizedBox(height: size.width * 0.3),
              ]),
              Positioned(left: size.width * 0.12,
                top: size.height * 0.85,
                height: size.height * 0.1,
                width: size.width * 0.75,
                child: homeBar(context))
            ],
          )
      ),
    );
  }
}
