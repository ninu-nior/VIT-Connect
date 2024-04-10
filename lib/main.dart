import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vit_connect_plus/features/authentication/login.dart';
import 'package:vit_connect_plus/navigation_menu.dart';
import 'package:vit_connect_plus/utils/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        //sets the default theme to the systems theme
        themeMode: ThemeMode.system,
        //light theme
        theme: TAppTheme.lightTheme,
        //dark theme
        darkTheme: TAppTheme.darkTheme,
        home: LoginScreen());
  }
}
