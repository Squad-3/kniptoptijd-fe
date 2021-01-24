import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kniptoptijd/components/button.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

Card renderKapperCard(Kapsalon kapper, BuildContext context) {
  return Card(
    margin: EdgeInsets.only(bottom: 8),
    child: Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color(0x11000000),
          blurRadius: 24.0,
          spreadRadius: 4.0,
        )
      ], border: Border.all(width: 2.0, color: const Color(0x11000000))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(kapper.naam, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Quicksand'), maxLines: 1,),
                  RatingBar.builder(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: EdgeInsets.only(
                        top: 2.0, bottom: 10.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                  ),
                  Text(kapper.straatnaam,),
                  Text(kapper.stad,),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/logos/"+kapper.kapperId.toString()+".png"),
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 10),
                  button(context, kapper),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
