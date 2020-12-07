import 'package:flutter/material.dart';

final ThemeData data = new ThemeData(
  //Theme colors
  brightness: Brightness.light,
  primarySwatch: MaterialColor(CustomColors.primary[500].value, CustomColors.primary),
  primaryColor: CustomColors.primary[500],
  primaryColorBrightness: Brightness.light,
  // accentColor: CustomColors.green[500],
  //accentColorBrightness: Brightness.light,


  //Typography styling
  fontFamily: 'Georgia',

  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),

  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class CustomColors {
  CustomColors._();
  static const Map<int, Color> primary = const <int, Color> {
    50: const Color(0xfff37575),
    100: const Color(0xfff37575),
    200: const Color(0xfff37575),
    300: const Color(0xfff26d6d),
    400: const Color(0xfff16565),
    500: const Color(0xfff15d5d),
    600: const Color(0xffef4d4d),
    700: const Color(0xffee3e3e),
    800: const Color(0xffed2e2e),
    900: const Color(0xffed2e2e)
  };

  // static const Map<int, Color> green = const <int, Color> {
  //   50: const Color(/* some hex code */),
  //   100: const Color(/* some hex code */),
  //   200: const Color(/* some hex code */),
  //   300: const Color(/* some hex code */),
  //   400: const Color(/* some hex code */),
  //   500: const Color(/* some hex code */),
  //   600: const Color(/* some hex code */),
  //   700: const Color(/* some hex code */),
  //   800: const Color(/* some hex code */),
  //   900: const Color(/* some hex code */)
  // };

}