import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapperdata.dart';
import 'package:provider/provider.dart';

class PushedScreen extends StatelessWidget {
  static const route = '/first/pushed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pushed screen')),
      body: Center(
        child: Text(Provider.of<KapperData>(context).kapperData.naam),
      ),
    );
  }
}