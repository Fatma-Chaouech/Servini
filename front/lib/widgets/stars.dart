import 'package:flutter/cupertino.dart';


void star(List<Widget> stars, double numberStars) {
  for (var i = 0; i < 5; i++) {
    if (numberStars >= 1) {
      stars.add(Image.asset("assets/full_star.png", height: 22));
      numberStars--;
    }
    else if (numberStars > 0) {
      stars.add(Image.asset("assets/half_star.png", height: 22));
      numberStars--;
    }
    else {
      stars.add(Image.asset("assets/empty_star.png", height: 22));
    }

  }
}