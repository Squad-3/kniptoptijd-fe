import 'package:flutter/material.dart';
import 'HomePageWidget.dart';

class NavigationViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationViewWidgetState();
  }
}

//navigation bar
class _NavigationViewWidgetState extends State<NavigationViewWidget> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageWidget(),
    Container(
      color: Colors.grey,
    ),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      resizeToAvoidBottomInset: false,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
