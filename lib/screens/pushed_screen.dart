import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalonState.dart';
import 'package:provider/provider.dart';

import 'behandeling_overview.dart';

class PushedScreen extends StatelessWidget {
  static const route = '/first/pushed';

  @override
  Widget build(BuildContext context) {
    return KappersBehandeling();
  }
}