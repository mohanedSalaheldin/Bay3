import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

MaterialColor mainAppColor = const MaterialColor(
  0x5A56E9,
  <int, Color>{
    50: Color(0x005a56e9),
    100: Color(0x005a56e9),
    200: Color(0x005a56e9),
    300: Color(0x005a56e9),
    400: Color(0x005a56e9),
    500: Color(0x005a56e9),
    600: Color(0x005a56e9),
    700: Color(0x005a56e9),
    800: Color(0x005a56e9),
    900: Color(0x005a56e9),
  },
);
ThemeData getAppTheme() => ThemeData(
    fontFamily: 'poppins',
    scaffoldBackgroundColor: HexColor('#f5f4f9'),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: HexColor('#f5f4f9'),
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    primarySwatch: mainAppColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        height: 1.1,
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 18.0,
        color: HexColor('#868686'),
        fontWeight: FontWeight.normal,
      ),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(AppColors.mainColor),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('#f5f4f9'),
      elevation: 0.0,
    ));
