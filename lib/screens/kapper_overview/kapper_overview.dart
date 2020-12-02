import 'dart:convert';
import 'package:flutter/material.dart';
import 'kapper_card.dart';

class KapperOverview extends StatelessWidget {

  KapperOverview();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle
        .of(context)
        .loadString('assets/kappers.json'),
      builder: (context, snapshot) {
        var kappers = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemCount: kappers == null ? 0 : kappers.length,
          itemBuilder: (BuildContext context, int index) {
            return renderKapperCard(kappers[index]['name'], kappers[index]['id'], context);
          },
        );
      }
    );
  }
}
