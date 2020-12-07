import 'package:flutter/material.dart';
import 'package:kniptoptijd/screens/pushed_screen.dart';
import '../theme.dart' as Theme;

FlatButton button(BuildContext context) {
  return FlatButton(
    onPressed: () {
      Navigator.of(
        context,
        rootNavigator: false,
      ).pushNamed(PushedScreen.route);
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.data.primaryColor,
      ),
      child: Text(
        "Reserveer",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}