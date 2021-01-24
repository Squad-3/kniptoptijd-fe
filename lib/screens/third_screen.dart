import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kniptoptijd/models/contactGegevens.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:kniptoptijd/models/searchQueries.dart';
import 'package:kniptoptijd/screens/HomePageWidget.dart';
import 'package:kniptoptijd/screens/bevestiging_mail.dart';
import 'package:kniptoptijd/services/createAppointment.dart';
import '../theme.dart' as Theme;
import 'package:provider/provider.dart';
import 'behandeling_overview.dart';

import 'behandeling_overview.dart';

class ThirdScreen extends StatelessWidget {
  static const route = '/third';
  CreateAppointment createAppointment = CreateAppointment();

  Color mainColor = Color(0xfff15d5d);

  @override
  Widget build(BuildContext context) {
    var reservering = Provider.of<ReserveringDetails>(context);
    var search = Provider.of<SearchQueries>(context);

    final contactNaamController = TextEditingController();
    final contactEmailController = TextEditingController();
    final contactTelefoonController = TextEditingController();

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
                    "assets/images/hakan_banner.png"), //path veranderen voor een andere image/swoosh
                fit: BoxFit.contain,
                alignment: Alignment(-1.0, -1.0)),
          ),
        ),
        Container(
          //Is de hele body alles wat op de pagina staat en/of komt
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 50),
          child: FractionallySizedBox(
            // De container maar dan iets smaller 90% in dit geval
            widthFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, //main en cross, zijn afhankelijk van een column of row, ene is horizontaal ene is verticaal
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
                        reservering.kapsalonData.naam,
                        style: TextStyle(
                          fontSize: 24.0, color: Colors.white, fontFamily: 'Quicksand', fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
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
                                    reservering.kapsalonData.naam,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating: 4.5,
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
                                  ),
                                  Text(
                                    'Overzicht reservering:\n',
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: AutoSizeText(
                                          'Knippen man, €25,-',
                                          style: TextStyle(
                                            fontSize: 19.0,
                                            fontFamily: 'FiraSans',
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        KappersBehandeling(),
                                                  ));
                                            },
                                            padding: EdgeInsets.all(0),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13, vertical: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(50),
                                                color: Theme.theme.primaryColor,
                                              ),
                                              child: Text(
                                                'Wijzigen',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: AutoSizeText(
                                          'Uw kapper: ' +
                                              reservering.gekozenKapper,
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontFamily: 'FiraSans',
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        KappersBehandeling(),
                                                  ));
                                            },
                                            padding: EdgeInsets.all(0),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13, vertical: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Theme.theme.primaryColor,
                                              ),
                                              child: Text(
                                                'Wijzigen',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: AutoSizeText(
                                          search.dateInput + ' om ' + search.timeInput,
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontFamily: 'FiraSans',
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePageWidget(),
                                                  ));
                                            },
                                            padding: EdgeInsets.all(0),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13, vertical: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(50),
                                                color: Theme.theme.primaryColor,
                                              ),
                                              child: Text(
                                                'Wijzigen',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
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
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  TextFormField(
                                    controller: contactNaamController,
                                    decoration: InputDecoration(
                                      hintText: 'Naam',
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff707070)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.theme.primaryColor),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Veld invullen is verplicht';
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: contactEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Emailadres',
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff707070)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.theme.primaryColor),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Veld invullen is verplicht';
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: contactTelefoonController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: 'Telefoonnummer',
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff707070)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.theme.primaryColor),
                                        borderRadius: BorderRadius.circular(30),
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
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BevestigingsMail(),
                                          ));
                                      // Provider.of<ContactGegevens>(context).updateContactGegevens(contactNaamController.text, contactEmailController.text, contactTelefoonController.text);
                                      // createAppointment.postAppointment(context);
                                    },
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 11),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Theme.theme.primaryColor,
                                        ),
                                        child: Text(
                                          'Afspraak bevestigen',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w700,
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
