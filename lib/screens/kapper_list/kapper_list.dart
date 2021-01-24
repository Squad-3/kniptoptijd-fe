import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';
import 'package:kniptoptijd/models/kapsalonSearchResults.dart';
import 'package:kniptoptijd/models/searchQueries.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'kapper_card.dart';
import 'package:provider/provider.dart';

class KapperList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Kapsalon> kappers = Provider.of<KapsalonSearchResults>(context).searchResults;
    if(kappers.length != 0) {
        return ListView(
          padding: EdgeInsets.all(0),
          children: kappers
              .map<Widget>((Kapsalon kapper) => renderKapperCard(kapper, context))
              .toList(),
        );
    }
    else {
      return Container(color: Colors.white, child: Center(child: CircularProgressIndicator()));
    }
  }
}


class SetKappers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final LocationSearch locationSearch = LocationSearch();
    log('fetching data');

    return FutureBuilder(
        future: locationSearch.getKappers(Provider.of<SearchQueries>(context).searchInput),
        builder: (BuildContext context, AsyncSnapshot<List<Kapsalon>> snapshot) {
          if (snapshot.hasData) {
            Provider.of<KapsalonSearchResults>(context).updateKapsalons(snapshot.data);
            List<Kapsalon> kappers = Provider.of<KapsalonSearchResults>(context).searchResults;
            return KapperList();
          }
          return Container(color: Colors.white, child: Center(child: CircularProgressIndicator()));
        });
  }
}