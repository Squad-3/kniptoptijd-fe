import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart' as Theme;
import 'package:provider/provider.dart';
import 'package:kniptoptijd/models/kapsalonState.dart';

class KappersBehandeling extends StatefulWidget {
  //de hele pagina valt onder class KapperOverview
  static const route = '/overview'; //route
  KappersBehandeling({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _KappersBehandelingState createState() => _KappersBehandelingState();
}

class _KappersBehandelingState extends State<KappersBehandeling> {
  //Hier haalt flutter zijn content vandaan

  var _value = false;
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  String valueChoose;
  List listItem = [
    'Geen voorkeur', 'Hakan', 'Bert', 'Milou', 'Arno', 'Jeroen', 'Stijn'
  ];

  @override
  Widget build(BuildContext context) {
    var kapper = Provider.of<KapsalonState>(context).kapsalonData;
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
                        hintText: kapper.naam,
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
                                    'Behandelingen',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Text(
                                    ' \n Selecteer uw behandelingen hieronder:',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15.0),
                                  ),
                                  CheckboxListTile(
                                      value: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                    title: Text('Knippen heer 25€'),
                                    subtitle: Text('ca. 30 minuten'),
                                    isThreeLine: true,
                                  ),
                                  CheckboxListTile(
                                    value: _value1,
                                    onChanged: (value) {
                                      setState(() {
                                        _value1 = value;
                                      });
                                    },
                                    title: Text('Opscheer met fade 20€'),
                                    subtitle: Text('ca. 20 minuten'),
                                    isThreeLine: true,
                                  ),
                                  CheckboxListTile(
                                    value: _value5,
                                    onChanged: (value) {
                                      setState(() {
                                        _value5 = value;
                                      });
                                    },
                                    title: Text('Knippen vrouw 35€'),
                                    subtitle: Text('ca. 45 minuten'),
                                    isThreeLine: true,
                                  ),
                                  CheckboxListTile(
                                    value: _value6,
                                    onChanged: (value) {
                                      setState(() {
                                        _value6 = value;
                                      });
                                    },
                                    title: Text('Knippen & brushing 60€'),
                                    subtitle: Text('ca. 1 uur en 15 minuten'),
                                    isThreeLine: true,
                                  ),
                                  CheckboxListTile(
                                    value: _value2,
                                    onChanged: (value) {
                                      setState(() {
                                        _value2 = value;
                                      });
                                    },
                                    title: Text('Knippen kind 20€'),
                                    subtitle: Text('ca. 30 minuten'),
                                    isThreeLine: true,
                                  ),
                                  CheckboxListTile(
                                    value: _value3,
                                    onChanged: (value) {
                                      setState(() {
                                        _value3 = value;
                                      });
                                    },
                                    title: Text('Baard trimmen 20€'),
                                    subtitle: Text('ca. 30 minuten'),
                                    isThreeLine: true,
                                  ),
                                  CheckboxListTile(
                                    value: _value4,
                                    onChanged: (value) {
                                      setState(() {
                                        _value4 = value;
                                      });
                                    },
                                    title: Text('Haar verven 65€'),
                                    subtitle: Text('ca. 1 uur en 30 minuten'),
                                    isThreeLine: true,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: DropdownButton(
                                        hint: Text('Selecteer uw kapper:'),
                                        icon: Icon(Icons.content_cut),
                                        iconSize: 22,
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                        ),
                                        value: valueChoose,
                                        onChanged: (newValue) {
                                          setState(() {
                                            valueChoose = newValue;
                                          });
                                        },
                                        items: listItem.map((valueItem) {
                                          return DropdownMenuItem(
                                              value : valueItem,
                                              child: Text(valueItem),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                      onPressed: () {

                                      },
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
