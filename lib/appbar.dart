import 'package:flutter/material.dart';
import 'colors.dart';
import 'searchbar.dart';

Widget CustomAppBar(){
  return Image.asset(
    "assets/logo.png",
    width: 120,
  );
}



//
// class CurvedPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = darkOrange
//       ..strokeWidth = 15;
//
//
//     var path = Path();
//
//
//    path.lineTo(0, size.height * 1.3);
//     path.quadraticBezierTo(size.width * 0.25, size.height * 1.3,
//         size.width * 0.5, size.height * 1.2);
//     path.quadraticBezierTo(size.width * 0.75, size.height * 1.1,
//         size.width * 1.0, size.height * 1.2);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }