import 'package:flutter/cupertino.dart';
import '../colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget heartButton(BuildContext context){
  final size = MediaQuery.of(context).size;
  return Container(
    height: size.height * 0.1,
    width: size.width * 0.23,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      boxShadow: [
        BoxShadow(
          color: bubbleWhite,
        ),
        BoxShadow(
          color: purple,
          spreadRadius: -5,
          blurRadius: 25,
        ),
      ],
    ),
    child: SvgPicture.asset(
      "assets/empty_heart.svg",
      fit: BoxFit.scaleDown,
    ),
  );
}