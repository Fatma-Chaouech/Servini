import 'package:flutter/material.dart';
import 'package:servini_app/colors.dart';


Widget titleRow(String firstTitle){
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: Text(
          firstTitle,
          style: const TextStyle(
            color: writingBlue,
            fontFamily: "GilroySemiBold",
            fontSize: 15,
          ),
        ),
      ),
      const Expanded(
        flex: 1,
        child: Text(
          "See All",
          style: TextStyle(
            color: writingBlue,
            fontFamily: "GilroyLight",
            fontSize: 10,
          ),
        ),
      )
    ],
  );
}