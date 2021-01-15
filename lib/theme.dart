import 'package:flutter/material.dart';

// class AppTheme {
//   Color primary;
//   Color secondary;
//   bool isDark;
//
//   /// Default constructor
//   AppTheme({@required this.isDark});
//
//   ThemeData get themeData {
//     /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
//     TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
//     Color txtColor = txtTheme.bodyText1.color;
//     ColorScheme colorScheme = ColorScheme(
//       // Decide how you want to apply your own custom them, to the MaterialApp
//         brightness: isDark ? Brightness.dark : Brightness.light,
//         primary: accent1,
//         primaryVariant: accent1,
//         secondary: accent1,
//         secondaryVariant: accent1,
//         background: bg1,
//         surface: bg1,
//         onBackground: txtColor,
//         onSurface: txtColor,
//         onError: Colors.white,
//         onPrimary: Colors.white,
//         onSecondary: Colors.white,
//         error: Colors.red.shade400);
//
//     /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
//     var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
//     // We can also add on some extra properties that ColorScheme seems to miss
//         .copyWith(buttonColor: accent1, cursorColor: accent1, highlightColor: accent1, toggleableActiveColor: accent1);
//
//     /// Return the themeData which MaterialApp can now use
//     return t;
//   }
// }

final ThemeData data = new ThemeData(
  //Theme colors
  brightness: Brightness.light,
  primarySwatch: MaterialColor(ThemeColors.primary[500].value, ThemeColors.primary),
  primaryColor: ThemeColors.primary[500],
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

class ThemeColors {
  ThemeColors._();

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

const LargeTextSize = 25.0;
const MediumTextSize = 20.0;
const BodyTextSize = 16.0;

const String TitleFont = 'Quicksand';

const AppBarTextStyle = TextStyle(
  fontFamily: TitleFont,
  fontWeight: FontWeight.w300,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const MainTitleStyle = TextStyle(
    fontFamily: TitleFont,
    fontWeight: FontWeight.w600,
    fontSize: LargeTextSize,
    color: Colors.white,
    letterSpacing: 5.0);

const Body1TextStyle = TextStyle(
  fontFamily: TitleFont,
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.white,
);