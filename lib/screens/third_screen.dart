import 'package:flutter/material.dart';
import '../style.dart';

class ThirdScreen extends StatelessWidget {
  static const route = '/third';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
          child: Column(
            children: [
              Text('Home'),
              Text('Account'),
            ],
          ),
        ),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(title: AppBarTextStyle),
            ),
            textTheme: TextTheme(
              title: MainTitleStyle,
              body1: Body1TextStyle,
            )
        )
    );
  }
}
