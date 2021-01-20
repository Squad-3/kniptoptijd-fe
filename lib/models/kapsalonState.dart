import 'package:flutter/material.dart';

class KapsalonState extends ChangeNotifier {
  dynamic kapsalonData;

  void updateKapsalonState(input) {
    kapsalonData = input;
    notifyListeners();
  }
}