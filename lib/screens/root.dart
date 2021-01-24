import 'package:flutter/material.dart';
import '../providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import '../theme.dart' as Theme;

/// Navigation entry point for app.
class Root extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        // Create bottom navigation bar items from screens.

        final bottomNavigationBarItems = provider.screens
          .map((screen) => BottomNavigationBarItem(
            icon: [Icon(Icons.home), Icon(Icons.search), Icon(Icons.menu)][provider.screens.indexOf(screen)],
            label: screen.title,
          ))
          .toList();

        // Initialize [Navigator] instance for each screen.
        final screens = provider.screens
          .map(
            (screen) => Navigator(
              key: screen.navigatorState,
              onGenerateRoute: screen.onGenerateRoute,
            ),
          )
        .toList();

        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            body: Center(
              child: screens[provider.currentTabIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItems,
              selectedItemColor: Theme.theme.primaryColor,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
  
}