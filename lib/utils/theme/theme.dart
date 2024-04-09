import 'package:flutter/material.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/appbar_theme.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/bottom_sheet_theme.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/checkbox_theme.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/chip_theme.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/elevated_button_theme.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/text_field_theme.dart';
import 'package:vit_connect_plus/utils/theme/custom%20themes/text_theme.dart';

//custom widget
class TAppTheme {
  //to make sure that this theme constructor is not used again and again, we make it private
  TAppTheme._(); //underscore sign indicated private constructor
  //function with return type themedata and name lghttheme
  //static ThemeData lightTheme() {}
  //or you can create a variable of themedata
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.LightElevatedbuttonTheme,
      appBarTheme: TAppBarTheme.LightAppBarTHeme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
      chipTheme: TChipTheme.lightChipTheme,
      inputDecorationTheme: TtextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.DarkElevatedbuttonTheme,
    appBarTheme: TAppBarTheme.DarkAppBarTHeme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TtextFormFieldTheme.darkInputDecorationTheme,
  );
}
