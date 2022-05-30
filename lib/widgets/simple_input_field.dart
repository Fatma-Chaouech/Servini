import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';

Widget simpleInputField(width, height, text){
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      cursorColor: writingBlue,
      obscureText: true,
      style: const TextStyle(
        color: inputText,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
        color: Colors.white.withOpacity(0),
        width: 2.0,
          ),
      ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelText: text,
      ),
    ),
  );
}


