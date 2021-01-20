import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class KapsalonSearchResults extends ChangeNotifier {
  List<Kapsalon> searchResults = [];

  void updateKapsalons(input) {
    searchResults = input;
  }

}