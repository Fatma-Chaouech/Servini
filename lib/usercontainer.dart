import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'colors.dart';
import 'searchbar.dart';
import 'appbar.dart';


Widget UserContainer(){
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    margin: const EdgeInsets.fromLTRB(23, 10, 23, 0),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18)
      ),
    ),
    child: Row(
      children: [
        ClipOval(
          child: Image.asset(
            "assets/user.png",
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Firas Ghanmi",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "GilroyBold",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Stars(),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Text(
                    "I'm a professional scientist who loves helping",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "GilroyRegular",
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "others.",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "GilroyRegular",
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: LabelCategory(),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}


Widget Stars(){
  return Row(
    children: const [
      Icon(
          Icons.star,
        size: 15,
      ),
      Icon(
        Icons.star,
        size: 15,
      ),
      Icon(
        Icons.star,
        size: 15,
      ),
      Icon(
        Icons.star,
        size: 15,
      ),
      Icon(
        Icons.star,
        size: 15,
      ),
    ],
  );
}

Widget LabelCategory(){
  return Container(
    width: 69,
    height: 20,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          darkYellow,
          lightYellow,
        ],
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24)
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Catgory",
          style: TextStyle(
            fontFamily: 'GilroyMedium',
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}