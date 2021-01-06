import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapperdata.dart';
import 'package:kniptoptijd/models/kapsalons.dart';
import 'providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider<KapperData>(create: (context) => KapperData()),
        ChangeNotifierProvider<Kapsalons>(create: (context) => Kapsalons()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          );
        },
      ),
    );
  }
}