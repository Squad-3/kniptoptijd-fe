import 'package:flutter/material.dart';
import 'package:kniptoptijd/components/button.dart';
import 'package:kniptoptijd/models/kapper_model.dart';

Card renderKapperCard(Kapper kapper, BuildContext context) {
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
            Text(kapper.naam),
            button(context),
          ],
        ),
      ),
    ),
  );
}