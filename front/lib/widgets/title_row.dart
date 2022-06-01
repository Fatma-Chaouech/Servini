

import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';


Widget titleRow(String firstTitle,Widget widget,BuildContext context){
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: Text(
          firstTitle,
          style: const TextStyle(
            color: writingBlue,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
       Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: ()=>{Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
          )},
          child: Text(
            "See All",
            style: TextStyle(
              color: writingBlue,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
        ),
      )
    ],
  );
}