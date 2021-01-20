import 'package:flutter/material.dart';
import 'package:kniptoptijd/components/button.dart';
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

Card renderBehandelingList(Behandeling behandeling, BuildContext context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
    child: Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color(0x11000000),
          blurRadius: 24.0,
          spreadRadius: 4.0,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(behandeling.naam, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 24),),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 80,
                  width: 80,
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
