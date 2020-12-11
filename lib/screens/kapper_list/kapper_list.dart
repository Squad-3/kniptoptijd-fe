import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapper_model.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'kapper_card.dart';

class KapperList extends StatelessWidget {
  final LocationSearch locationSearch = LocationSearch();
  KapperList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locationSearch.getKappers(),
        // DefaultAssetBundle
        // .of(context)
        // .loadString('assets/kappers.json'),
        builder: (BuildContext context, AsyncSnapshot<List<Kapper>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            List<Kapper> kappers = snapshot.data;
            return ListView(
              children: kappers
                  .map((Kapper kapper) => renderKapperCard(kapper, context))
                  .toList(),
                  // .map((Kapper kapper) => ListTile(
                  //       title: Text(kapper.naam),
                  //     ))
                  // .toList(),
            );

            // return ListView.builder(
            //   padding: EdgeInsets.only(top: 4),
            //   itemCount: kappers == null ? 0 : kappers.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     kappers.map((Kapper kapper) => renderKapperCard(kapper, context));
            //     // return renderKapperCard(kappers.map(Kapper kapper), context);
            //   },
            // );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
