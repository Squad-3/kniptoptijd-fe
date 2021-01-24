import 'dart:math';
import 'package:kniptoptijd/screens/kapper_behandelingen.dart';

import 'third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kniptoptijd/providers/navigation_provider.dart';
import 'package:kniptoptijd/screens/third_screen.dart';
import '../theme.dart' as Theme;
import 'package:provider/provider.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';

class KappersBehandeling extends StatefulWidget {
  //de hele pagina valt onder class KapperOverview
  static const route = '/behandelingen'; //route
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

  var _value = false;
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  String valueChoose;
  List listItem = ['Geen voorkeur', 'Hakan', 'Bert', 'Arno', 'Jeroen', 'Stijn'];

  @override
  Widget build(BuildContext context) {
    var kapper = Provider.of<ReserveringDetails>(context).kapsalonData;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/hakan_banner.png"),
                fit: BoxFit.contain,
                alignment: Alignment(-1.0, -1.0)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 50),
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 32,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                    ),
                      Text(
                        kapper.naam,
                        style: TextStyle(
                          fontSize: 24.0, color: Colors.white, fontFamily: 'Quicksand', fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
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
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    'Behandelingen',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand',
                                        fontSize: 28.0),
                                  ),
                                Text(
                                  ' \n Selecteer uw behandelingen hieronder:',
                                  style: TextStyle(
                                      fontFamily: 'FiraSans',
                                      fontSize: 15.0),
                                ),
                              ],
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x11000000),
                              offset: Offset(0, 24),
                              blurRadius: 24.0,
                              spreadRadius: 4.0,
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: KapperBehandelingen()),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Container(
                                      padding:
                                      EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: DropdownButton(
                                        hint: Text('Selecteer uw kapper:', style: TextStyle(fontFamily: 'FiraSans'),),
                                        icon: Icon(Icons.content_cut),
                                        iconSize: 22,
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                        value: valueChoose,
                                        onChanged: (newValue) {
                                          setState(() {
                                            valueChoose = newValue;
                                          });
                                        },
                                        items: listItem.map((valueItem) {
                                          return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem, style: TextStyle(fontFamily: 'FiraSans'),),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ThirdScreen(),
                                          ));
                                      Provider.of<ReserveringDetails>(context).updateGekozenKapper(valueChoose.toString());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Theme.theme.primaryColor,
                                      ),
                                      child: Text(
                                        "Reserveer",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
