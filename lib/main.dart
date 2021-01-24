import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/contactGegevens.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:kniptoptijd/models/kapsalonSearchResults.dart';
import 'package:kniptoptijd/models/searchQueries.dart';
import 'package:kniptoptijd/screens/kapper_overview.dart';
import 'package:kniptoptijd/services/location_search.dart';
import 'package:kniptoptijd/theme.dart';
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
        ChangeNotifierProvider<SearchQueries>(create: (context) => SearchQueries()),
        ChangeNotifierProvider<ContactGegevens>(create: (context) => ContactGegevens()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/overview': (context) => KapperOverview(origin: 2),
              '/behandelingen': (context) => KappersBehandeling(),
            },
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
            theme: theme,
          );
        },
      ),
    );
  }
}