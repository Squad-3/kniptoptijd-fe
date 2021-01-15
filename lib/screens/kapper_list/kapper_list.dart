import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapper.dart';
import 'package:kniptoptijd/models/kapsalons.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'kapper_card.dart';
import 'package:provider/provider.dart';

class KapperList extends StatelessWidget {
  final LocationSearch locationSearch = LocationSearch();

  KapperList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locationSearch.getKappers(),
        builder: (BuildContext context, AsyncSnapshot<List<Kapper>> snapshot) {
          if (snapshot.hasData) {
            Provider.of<Kapsalons>(context).updateKapsalons(snapshot.data);
            List<Kapper> kappers = Provider.of<Kapsalons>(context).kapsalons;
            return ListView(
              padding: EdgeInsets.all(0),
              children: kappers
                  .map((Kapper kapper) => renderKapperCard(kapper, context))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
