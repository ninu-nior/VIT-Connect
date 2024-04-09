//the constants folder contains features or variables which are constand throughout the app
import 'package:flutter/material.dart';

class MyColors {
  MyColors._();
  //app basic colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  //text colors
  static const Color TextPrimary = Color(0xFF333333);
  static const Color TextSecondary = Color(0xff6c7570);
  static const Color textWhite = Colors.white;

  //background colors
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  //background container colors
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xff6c7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //border colors
  static const Color borderPrimary = Color(0xFFD9d9d9);
  static const Color borderSecondary = Color(0xffe6e6e6);

  //error and validation colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Color.fromARGB(241, 245, 122, 14);
  static const Color infor = Color(0xff197602);

  //Neutral Colors
  static const Color black = Colors.black;
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Colors.grey;
  static const Color softGrey = Color(0xFFF4F4f4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Colors.white;
}
