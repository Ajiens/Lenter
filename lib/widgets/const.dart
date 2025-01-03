import 'package:flutter/material.dart';

class Constant{
  //Background
  static Color blackPrimary = Color.fromRGBO(28, 28, 30, 1);
  static Color blackSecondary = Color.fromRGBO(40, 38, 42, 1);
  //Text Color
  static Color textColorPrimary = Colors.white;
  static Color textColorSecondary = Color.fromRGBO(123, 123, 125, 1);
  //Accent Color
  static Color accentPrimary = Color.fromRGBO(183, 57, 225, 1);
  static Color accentSecondary = Color.fromRGBO(213, 105, 249, 1);
  
  static LinearGradient gradientColor = LinearGradient(
            colors: [Constant.accentSecondary, Constant.accentPrimary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,);
  
  static String endPoint = "https://alwantaka.pythonanywhere.com";
}