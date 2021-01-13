import 'package:flutter/material.dart';
import 'package:kniptoptijd/screens/behandelingList.dart';
import 'package:kniptoptijd/screens/behandeling_overview.dart';
import 'package:kniptoptijd/theme.dart';

import 'kapper_behandelingen.dart';



class ThirdScreen extends StatelessWidget {
  static const route = '/third';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),backgroundColor: data.primaryColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: SizedBox(
                  height: 200.0,
                    child: KapperBehandelingen()
                )
            ),
          ],
        ),
      ),
    );
  }
}