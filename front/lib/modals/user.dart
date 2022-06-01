import 'dart:ffi';

import 'package:servini_app/modals/request.dart';

import 'offer.dart';

class User{
  String username;
  String email;
  String fullname;
  String bio;
  String location;
  Double rating;
  //getoffersbyuser


  User({
    required this.username,
    required this.email,
    required this.fullname,
    required this.bio,
    required this.location,
    required this.rating,

  }
      );
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"],
      email: json["email"],
      fullname: json["fullname"],
      bio: json["bio"],
      location: json["location"],
      rating: json["rating"],

    );
  }
}