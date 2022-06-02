import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';

import '../widgets/stars.dart';



Widget userContainer(BuildContext context, String username,String bio,double nb){
  final size = MediaQuery.of(context).size;
  final stars = <Widget> [];
  star(stars,nb);
  return Column(
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(size.width * 0.035, size.height * 0.015, size.width * 0.035,  size.height * 0.015),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/user.png",
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.04, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          color: writingBlue,
                          fontSize: 13,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Row(
                          children: stars,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children:  [
                      SizedBox(
                        width:200,
                        child: Text(
                          bio,maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(
                            color: writingBlue,
                            fontSize: 10,
                            fontFamily: "Gilroy",
                          ),
                        ),
                      )

                    ],
                  ),

                 /* Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: LabelCategory(),
                      )
                    ],
                  )*/
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: size.height * 0.01)
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
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}