import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalonState.dart';
import 'package:kniptoptijd/models/kapsalonSearchResults.dart';
import 'package:kniptoptijd/screens/kapper_overview.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'models/kapsalonBehandelingen.dart';
import 'providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:kniptoptijd/screens/behandeling_overview.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationSearch();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider<ReserveringDetails>(create: (context) => ReserveringDetails()),
        ChangeNotifierProvider<KapsalonSearchResults>(create: (context) => KapsalonSearchResults()),
        ChangeNotifierProvider<KapsalonBehandelingen>(create: (context) => KapsalonBehandelingen()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              '/overview': (context) => KapperOverview(origin: 2),
              '/behandelingen': (context) => KappersBehandeling(),
            },
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          );
        },
      ),
    );
  }
}