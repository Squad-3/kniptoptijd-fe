import 'package:flutter/material.dart';
import 'package:kniptoptijd/screens/behandeling_overview.dart';
import 'package:kniptoptijd/theme.dart';



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
            RaisedButton(
              child: Text('Button 1'),
            ),
            RaisedButton(
              child: Text('Button 2'),
            ),
          ],
        ),
      ),
    );
  }
}