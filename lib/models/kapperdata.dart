import 'package:flutter/material.dart';

class KapperData extends ChangeNotifier {
  dynamic kapperData;

  void updateKapper(input) {
    kapperData = input;
    notifyListeners();
  }
}