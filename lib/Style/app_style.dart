import 'dart:math';

import 'package:flutter/material.dart';

class AppStyle {
  static Color mainColor = const Color(0xFFF56C04);


//random background color for the image
  static List<Color> bookColors = [
    Colors.green.shade200,
    Colors.amber.shade200,
    Colors.red.shade200,
    Colors.blue.shade200,
    Colors.purple.shade200,
    Colors.pink.shade200,
    Colors.cyan.shade200,
    Colors.deepOrange.shade200,
    Colors.deepPurple.shade200,
    Colors.brown.shade200,
    Colors.teal.shade200,
    Colors.indigo.shade200,
    Colors.lime.shade200,
    Colors.orange.shade200,
    Colors.blueGrey.shade200,
  ];


  //random color for the circleAvatar and text of the author
  static List<Color> authorColors = [
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.brown,
    Colors.teal,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.blueGrey,
  ];

  static int getRandomIndex() => Random().nextInt(bookColors.length);

}