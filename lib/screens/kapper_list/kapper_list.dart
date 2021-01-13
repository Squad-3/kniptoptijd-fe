import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';
import 'package:kniptoptijd/models/kapsalonSearchResults.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'kapper_card.dart';
import 'package:provider/provider.dart';

class KapperList extends StatelessWidget {
  final get_kapsalon_details locationSearch = get_kapsalon_details();

  KapperList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locationSearch.getKappers(),
        builder: (BuildContext context, AsyncSnapshot<List<Kapsalon>> snapshot) {
          if (snapshot.hasData) {
            Provider.of<KapsalonSearchResults>(context).updateKapsalons(snapshot.data);
            List<Kapsalon> kappers = Provider.of<KapsalonSearchResults>(context).searchResults;
            return ListView(
              padding: EdgeInsets.all(0),
              children: kappers
                  .map((Kapsalon kapper) => renderKapperCard(kapper, context))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
