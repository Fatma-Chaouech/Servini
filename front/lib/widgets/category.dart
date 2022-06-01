import 'package:flutter/material.dart';

class Category2 extends StatelessWidget {
  String name, description, image;
  bool isRight;
  Category2(
      {Key? key,
      required this.name,
      required this.description,
      required this.image,
      required this.isRight});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double positionX, positionY;
    if (isRight) {
      positionY = size.height * 0.008;
      positionX = 0 ;
    } else {
      positionY = size.height * 0.992;;
      positionX = size.width;
    }
    return Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: [
      Container(
        width: size.width ,
        height: size.height * 0.2,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xff2CCFE2), Color(0xff8CF3FF)]),
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              name,
              style: const TextStyle(
                  color: Color(0xFF424E5E),
                  fontSize: 20,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 26, top: 10,right:145),
            child: Text(
              description,
              style: const TextStyle(
                  color: Color(0xFFF5F8FB),
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        ]),
      ),
      Positioned(
        child: Image.asset(image),
        bottom: positionY,
        right: positionX,
      ),
    ]);
  }
}
