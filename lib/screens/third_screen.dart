import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kniptoptijd/screens/HomePageWidget.dart';
import '../theme.dart' as Theme;
import 'package:provider/provider.dart';
import 'package:kniptoptijd/models/kapperdata.dart';
import 'behandeling_overview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'behandeling_overview.dart';

class ThirdScreen extends StatelessWidget {
  static const route = '/third';

  Color mainColor = Color(0xfff15d5d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Is de template van de screen, rode streep/logo van de kapsalon bovenin en menu onderin
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        // In de body vind je alle content terug bijvoorbeeld stack, meerdere elementen op elkaar (z-index)
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/kapper_hakan.jpg"), //path veranderen voor een andere image/swoosh
                fit: BoxFit.contain,
                alignment: Alignment(-1.0, -1.0)),
          ),
        ),
        Positioned(
          top: 40,
          left: 19,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 42,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          //Is de hele body alles wat op de pagina staat en/of komt
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 30),
          child: FractionallySizedBox(
            // De container maar dan iets smaller 90% in dit geval
            widthFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, //main en cross, zijn afhankelijk van een column of row, ene is horizontaal ene is verticaal
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    //EdgeInsets is eigenlijk de waarde van de padding, (EdgeInsets.only -- top left bottom right
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: '',
                        hintStyle:
                            TextStyle(fontSize: 24.0, color: Colors.grey[300])),
                  ),
                ),
                Expanded(
                  child: Row(
                    // Dit is een row en geen column omdat we de volledige breedte wilden gebruiken ipv volledige hoogte
                    children: [
                      Expanded(
                        // Expanded is: gebruikt volledige breedte die beschikbaar is dus in dit geval die 90% als het in een column was de volledige hoogte
                        child: Container(
                          decoration: BoxDecoration(
                              //styling geven aan een container, dmv boxdecoration desnoods flutter boxdecoration opzoeken
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0),
                                bottom: Radius.zero,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 24.0,
                                  spreadRadius: 4.0,
                                )
                              ]),
                          child: Padding(
                            // child/children is wat er in de element boven komt te staan
                            padding: const EdgeInsets.symmetric(
                              //onder andere container kan nooit meerdere children hebben andere elementen hebben een list aan children nodig
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                //als ik meerdere children in een container zou willen hebben zou ik er een row/column van moeten maken
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kapper Hakan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0),
                                  ),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 19,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: 2.0, vertical: 8.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text(
                                    'Overzicht reservering:\n',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 19.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Knippen man, €25,-',
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    KappersBehandeling(),
                                              ));
                                        },
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13, vertical: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Theme.data.primaryColor,
                                            ),
                                            child: Text(
                                              'Wijzigen',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Uw kapper: Bert      ',
                                        style: TextStyle(
                                          fontSize: 19,
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    KappersBehandeling(),
                                              ));
                                        },
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13, vertical: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Theme.data.primaryColor,
                                            ),
                                            child: Text(
                                              'Wijzigen',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '19 Januari, 14:30    ',
                                        style: TextStyle(
                                          fontSize: 19,
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePageWidget(),
                                              ));
                                        },
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13, vertical: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Theme.data.primaryColor,
                                            ),
                                            child: Text(
                                              'Wijzigen',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\nContactgegevens \n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Naam',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xfff15d5d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Veld invullen is verplicht';
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Emailadres',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xfff15d5d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Veld invullen is verplicht';
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Telefoonnummer',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xfff15d5d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Veld invullen is verplicht';
                                      }
                                    },
                                  ),
                                  Text('\n'),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                KappersBehandeling(),
                                          ));
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 11),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Theme.data.primaryColor,
                                        ),
                                        child: Text(
                                          'Bevestig',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
