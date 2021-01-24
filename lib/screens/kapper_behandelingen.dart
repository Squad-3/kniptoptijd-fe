import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/kapsalonBehandelingen.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:kniptoptijd/services/get_kapsalon_details.dart';
import 'package:kniptoptijd/theme.dart';
import 'behandelingList.dart';
import 'package:provider/provider.dart';

// class KapperBehandelingen extends StatelessWidget {
//   final GetKapsalonDetails kapsalonDetails = GetKapsalonDetails();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: kapsalonDetails.fetchBehandelingen(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<Behandeling>> snapshot) {
//           if (snapshot.hasData) {
//             Provider.of<KapsalonBehandelingen>(context)
//                 .updateBehandelingen(snapshot.data);
//             List<Behandeling> behandelingen =
//                 Provider.of<KapsalonBehandelingen>(context).behandelingen;
//             return ListView(
//               shrinkWrap: true,
//               padding: EdgeInsets.all(0),
//               children: behandelingen
//                   .map((Behandeling kapsalon) =>
//                       renderBehandelingList(kapsalon, context))
//                   .toList(),
//             );
//           }
//           return Center(child: CircularProgressIndicator());
//         });
//   }
// }

class BehandelingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Behandeling> kappers = Provider.of<KapsalonBehandelingen>(context).behandelingen;
    if(kappers.length != 0) {
      return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        children: kappers
            .map<Widget>((Behandeling behandeling) => RenderBehandelingList(behandeling))
            .toList(),
      );
    }
    else {
      return Container(width: 300 ,child: Text('Er zijn geen behandelingen gevonden voor deze kapsalon.', textAlign: TextAlign.center, style: TextStyle(color: Colors.red),));
    }
  }
}

class KapperBehandelingen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GetKapsalonDetails kapsalonDetails = GetKapsalonDetails();
    log('fetching data');

    return FutureBuilder(
        future: kapsalonDetails.fetchBehandelingen(Provider.of<ReserveringDetails>(context).kapsalonData.kapperId),
        builder: (BuildContext context, AsyncSnapshot<List<Behandeling>> snapshot) {
          if (snapshot.hasData) {
            Provider.of<KapsalonBehandelingen>(context).updateBehandelingen(snapshot.data);
            List<Behandeling> behandelingen = Provider.of<KapsalonBehandelingen>(context).behandelingen;
            return BehandelingList();
          }
          return Center(child: Text('Er kan geen verbinding worden gemaakt met de database.'));
        });
  }
}
