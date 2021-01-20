import 'package:flutter/material.dart';

class ReserveringDetails extends ChangeNotifier {
  dynamic kapsalonData;
  dynamic behandelingsData;

  void updateKapsalonData(input) {
    kapsalonData = input;
    notifyListeners();
  }
  
  void updateBehandelingsData(input) {
    behandelingsData = input;
    notifyListeners();
  }
}

