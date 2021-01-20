import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'kapper_list/kapper_list.dart';

class OverzichtReservering extends StatefulWidget {      //de hele pagina valt onder class KapperOverview
  static const route = '/';                  //route
  OverzichtReservering({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _OverzichtReserveringState createState() => _OverzichtReserveringState();
}


class _OverzichtReserveringState extends State<OverzichtReservering> {              //Hier haalt flutter zijn content vandaan
  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                   // Is de template van de screen, rode streep/logo van de kapsalon bovenin en menu onderin
      backgroundColor: Colors.transparent,
      body: Stack(children: [                                          // In de body vind je alle content terug bijvoorbeeld stack, meerdere elementen op elkaar (z-index)
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/scaffold-bg.png"),      //path veranderen voor een andere image/swoosh
                fit: BoxFit.contain,
                alignment: Alignment(-1.0, -1.0)),
          ),
        ),
        Container(                                  //Is de hele body alles wat op de pagina staat en/of komt
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 30),
          child: FractionallySizedBox(             // De container maar dan iets smaller 90% in dit geval
            widthFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,        //main en cross, zijn afhankelijk van een column of row, ene is horizontaal ene is verticaal
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(                //EdgeInsets is eigenlijk de waarde van de padding, (EdgeInsets.only -- top left bottom right
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "\'Test \' om test o'clock",
                      hintStyle:
                      TextStyle(fontSize: 16.0, color: Colors.grey[300]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(                                                    // Dit is een row en geen column omdat we de volledige breedte wilden gebruiken ipv volledige hoogte
                    children: [
                      Expanded(                                           // Expanded is: gebruikt volledige breedte die beschikbaar is dus in dit geval die 90% als het in een column was de volledige hoogte
                        child: Container(
                          decoration: BoxDecoration(                     //styling geven aan een container, dmv boxdecoration desnoods flutter boxdecoration opzoeken
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
                          child: Padding(                                 // child/children is wat er in de element boven komt te staan
                            padding: const EdgeInsets.symmetric(           //onder andere container kan nooit meerdere children hebben andere elementen hebben een list aan children nodig
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Column(                                     //als ik meerdere children in een container zou willen hebben zou ik er een row/column van moeten maken
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Test Skeleton',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                Text(
                                  'Lekker Testen',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
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