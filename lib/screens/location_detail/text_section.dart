import 'package:flutter/material.dart';
import '../../style.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _hPad = 16.0;

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(95.0, 160.0, _hPad, 50.0),
            child: Text(_title, style: MainTitleStyle),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(280.0, 100.0, _hPad, _hPad),
            child: Text(_body),
          )
        ]);
  }
}