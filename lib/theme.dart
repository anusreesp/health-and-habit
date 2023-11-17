import 'package:flutter/material.dart';

const manrope = "Manrope";

class AppTheme {
  static const greycolor = Color.fromARGB(255, 229, 239, 240);
  static const whiteColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff000000);
  static const tealColor = Colors.teal;

  static Color teal1Color = Colors.teal.shade600;
  static Color teal2Color = Colors.teal.shade800;
  static Color teal3Color = Colors.teal.shade200;

  static const darkGrey1Color = Color.fromARGB(255, 133, 139, 145);
  static const darkGrey2Color = Color(0xff525961);
  static const darkBlue1Color = Color(0xff0B1524);
  static const darkBlue2Color = Color.fromARGB(255, 18, 39, 71);

  static const facebookColor = Colors.blue;

  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: greycolor,
      appBarTheme: const AppBarTheme(
          backgroundColor: darkGrey2Color,
          elevation: 0,
          titleTextStyle: man16White),
    );
  }
}

const TextStyle man20Blue = TextStyle(
  fontFamily: manrope,
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: AppTheme.darkBlue2Color,
);
const TextStyle man32White = TextStyle(
  fontFamily: manrope,
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: AppTheme.whiteColor,
);

const TextStyle man26White = TextStyle(
  fontFamily: manrope,
  fontSize: 26,
  fontWeight: FontWeight.w700,
  color: AppTheme.whiteColor,
);

const TextStyle man24White = TextStyle(
  fontFamily: manrope,
  fontSize: 24,
  color: AppTheme.whiteColor,
);
const TextStyle man20White = TextStyle(
  fontFamily: manrope,
  fontSize: 20,
  color: AppTheme.whiteColor,
);
const TextStyle man16White = TextStyle(
  fontFamily: manrope,
  fontSize: 16,
  color: AppTheme.whiteColor,
);

const TextStyle man14White = TextStyle(
  fontFamily: manrope,
  fontSize: 14,
  color: AppTheme.whiteColor,
);

const TextStyle man24Black = TextStyle(
  fontFamily: manrope,
  fontSize: 24,
  color: AppTheme.blackColor,
);
const TextStyle man20Black = TextStyle(
  fontFamily: manrope,
  fontSize: 20,
  color: AppTheme.blackColor,
);
const TextStyle man16Black = TextStyle(
  fontFamily: manrope,
  fontSize: 16,
  color: AppTheme.blackColor,
);

const TextStyle man14Black = TextStyle(
  fontFamily: manrope,
  fontSize: 14,
  color: AppTheme.blackColor,
);
