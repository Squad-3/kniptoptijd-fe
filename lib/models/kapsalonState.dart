import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class ReserveringDetails extends ChangeNotifier {
  dynamic kapsalonData;
  dynamic behandelingsData = [];

  void updateKapsalonData(Kapsalon input) {
    kapsalonData = input;
    notifyListeners();
  }
  
  void updateBehandelingsData(int input) {
    behandelingsData.add(input);
    notifyListeners();
  }
}

