import 'package:flutter/material.dart';

class KapsalonSearchResults extends ChangeNotifier {
  List searchResults = [];

  void updateKapsalons(input) {
    searchResults = input;
  }

}