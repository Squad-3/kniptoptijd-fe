import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/kapsalon.dart';
import 'package:kniptoptijd/models/kapsalonBehandelingen.dart';
import 'package:kniptoptijd/models/kapsalonSearchResults.dart';
import 'package:kniptoptijd/services/get_kapsalon_details.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'behandelingList.dart';
import 'package:provider/provider.dart';

class KapperBehandelingen extends StatelessWidget {
  final GetKapsalonDetails kapsalonDetails = GetKapsalonDetails();

  KapperBehandelingen();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: kapsalonDetails.getBehandelingen(),
        builder: (BuildContext context, AsyncSnapshot<List<Behandeling>> snapshot) {
          if (snapshot.hasData) {
            Provider.of<KapsalonBehandelingen>(context).updateBehandelingen(snapshot.data);
            List<Behandeling> behandelingen = Provider.of<KapsalonBehandelingen>(context).behandelingen;
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              children: behandelingen
                  .map((Behandeling behandeling) => renderBehandelingList(behandeling, context))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
