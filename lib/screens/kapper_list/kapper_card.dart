import 'package:flutter/material.dart';
import 'package:kniptoptijd/components/button.dart';
import 'package:kniptoptijd/models/kapper_model.dart';

Card renderKapperCard(Kapper kapper, BuildContext context) {
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
                Text(kapper.naam, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 24),),
                Text(kapper.straatnaam,),
                Text(kapper.stad,),
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
                button(context),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
