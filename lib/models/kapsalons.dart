import 'package:flutter/material.dart';

class Kapsalons extends ChangeNotifier {
  List kapsalons = [];

  void updateKapsalons(input) {
    kapsalons = input;
  }
}