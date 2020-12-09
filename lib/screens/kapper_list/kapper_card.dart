import 'package:flutter/material.dart';
import 'package:kniptoptijd/components/button.dart';

Card renderKapperCard(String name, int id, BuildContext context) {
  return Card(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            button(context),
          ],
        ),
      ),
    ),
  );
}