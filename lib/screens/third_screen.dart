import 'package:flutter/material.dart';
import 'location_detail/location_detail.dart';
import '../style.dart';

class ThirdScreen extends StatelessWidget {
  static const route = '/third';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LocationDetail(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(title: AppBarTextStyle),
            ),
            textTheme: TextTheme(
              title: MainTitleStyle,
              body1: Body1TextStyle,
            )));
  }
}