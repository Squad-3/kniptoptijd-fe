import 'package:flutter/material.dart';
import '../providers/navigation_provider.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: ListView.builder(
        controller: NavigationProvider.of(context)
            .screens[HOME]
            .scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Tile $index'),
          );
        },
      ),
    );
  }
}