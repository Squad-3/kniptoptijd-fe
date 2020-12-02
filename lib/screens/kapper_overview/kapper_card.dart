import 'package:flutter/material.dart';
import '../../theme.dart' as Theme;
import 'package:kniptoptijd/components/button.dart';

Card renderKapperCard(String name, int id, BuildContext context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 24.0,
            spreadRadius: 4.0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          button(context),
        ],
      ),
    ),
  );
}