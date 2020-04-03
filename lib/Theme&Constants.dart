import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

ThemeData cardTheme = ThemeData();

BoxDecoration cardDecoration = BoxDecoration(
  color: Colors.grey[800],
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

final fad4 = SpinKitFadingFour(
  color: Colors.lime,
  shape: BoxShape.circle,
  size: 100,
);

TextStyle coordiTextStyle = TextStyle(
    fontSize: 35,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w900,
    color: Colors.white);

TextStyle locTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.white54,
);

TextStyle wIcon = TextStyle(fontSize: 40, fontWeight: FontWeight.w600);
