import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kniptoptijd/screens/third_screen.dart';

class ListScreen extends StatelessWidget {
  static const route = '/listscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen())
                );
              },
              child: Text('Go back!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
