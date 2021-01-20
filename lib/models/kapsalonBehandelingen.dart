import 'package:flutter/material.dart';

import 'behandeling.dart';

class KapsalonBehandelingen extends ChangeNotifier {
  List<Behandeling> behandelingen = [];

  void updateBehandelingen(input) {
    behandelingen = input;
  }

}