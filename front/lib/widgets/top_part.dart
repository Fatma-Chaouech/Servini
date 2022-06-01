import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:servini_app/screens/search_page.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../handlers/user_backend.dart';
import '../main.dart';
import '../modals/user.dart';

Widget topPart(BuildContext context,String username) {

  double numberStars = 0;
  final size = MediaQuery.of(context).size;
  final stars = <Widget>[];
  var _myAccount = false ;
  Map<String, dynamic> payload = Jwt.parseJwt(token);

  if(payload["username"] == username) {
    _myAccount = true ;
  }

  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [
          specialBlue,
          specialPurple,
        ],
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(91),
        bottomRight: Radius.circular(91),
      ),
      boxShadow: [
        BoxShadow(
          color: specialPurple.withOpacity(0.4),
          spreadRadius: 0,
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  size.width * 0.05, size.width * 0.05, 0, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                },
                child: SvgPicture.asset("assets/arrow.svg"),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.015),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                child: Image.asset(
                  "assets/level_3.png",
                  height: size.height * 0.18 + 8,
                ),
              ),
              ClipOval(
                child: Image.asset(
                  "assets/user.png",
                  width: size.height * 0.18,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Text(
          username,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "GilroySemiBold",
            fontSize: 25,
          ),
        ),
        /*const Text(
          "Science Professor & part-time tutor",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "GilroyRegular",
            fontSize: 13,
          ),
        ),*/
        SizedBox(height: size.height * 0.020),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/location.png",
                  height: 19,
                ),FutureBuilder(
                    future: getUser(username),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return Text('no data');
                        } else {
                          return Text(
                            snapshot.data["location"],
                            style: TextStyle(
                              fontFamily: "GilroyRegular",
                              color: Colors.white,
                            ),
                          );
                        }
                      } else if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Error'); // error
                      } else {
                        return const CircularProgressIndicator(); // loading
                      }
                    }
                )

              ],
            ),
            Row(
              children: [
                FutureBuilder(
                future: getUser(username),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState==ConnectionState.done){
                    if (snapshot.data == null) {
                      return Text('no data');
                    }
                  else {
                   if(snapshot.data["rating"]==0){numberStars=0.0;}
                    else {numberStars=snapshot.data["rating"];}
                    List<Widget> stars = <Widget>[];
                    for (var i = 0; i < 5; i++){
                      if (numberStars >= 1) {
                        stars.add(Image.asset("assets/full_star.png", height: 22));
                        numberStars--;
                      }
                      else if (numberStars > 0) {
                        stars.add(Image.asset("assets/half_star.png", height: 22));
                        numberStars--;
                      }
                      else {
                        stars.add(Image.asset("assets/empty_star.png", height: 22));
                      }
                    }
                    return Row(children:stars);
                  }

                  }
                else {return CircularProgressIndicator();}
                }
                  )],
            ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _myAccount? Text("") : GestureDetector(child: Image.asset("assets/recommend.png"),onTap: ()=>{},),
            SizedBox(width: size.width * 0.09),
            _myAccount? Text("") : GestureDetector(child: Image.asset("assets/message.png"),onTap: ()=>{},),
          ],
        ),
        _myAccount?SizedBox(height: size.height * 0.015) : SizedBox(height: size.height * 0.01) ,
      ],
    ),
  );
}
