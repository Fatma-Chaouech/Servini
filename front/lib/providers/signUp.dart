
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:servini_app/constants/routes.dart';


class SignUpResponse {
  final String pass;

  SignUpResponse({required this.pass});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      pass: json["username"]??"",
    );
  }
}

class SignUpRequest {
  String username="";
  String email="";
  String password="";
  String bio="";
  String fullname="";
  String location="";


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fullname': fullname.trim(),
      'username': username.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'bio': bio.trim(),
      'location': location.trim(),
    };

    return map;
  }
}

