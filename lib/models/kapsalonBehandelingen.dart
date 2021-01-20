import 'package:flutter/material.dart';

class KapsalonBehandelingen extends ChangeNotifier {
  List behandelingen = [];

  void updateBehandelingen(input) {
    behandelingen = input;
  }

}