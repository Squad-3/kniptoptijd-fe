import 'package:flutter/material.dart';
import '../theme.dart' as Theme;
import '../screens/listscreen.dart';

FlatButton button(BuildContext context) {
  return FlatButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListScreen()),
      );
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