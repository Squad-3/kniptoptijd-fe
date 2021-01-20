import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalonState.dart';
import 'package:kniptoptijd/screens/behandeling_overview.dart';
import 'package:provider/provider.dart';
import '../theme.dart' as Theme;

ButtonTheme button(BuildContext context, kapper) {
  return ButtonTheme(
    padding: EdgeInsets.all(0), //adds padding inside the button
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, //limits the touch area to the button area
    minWidth: 0, //wraps child's width
    height: 0,
    child: FlatButton(
      onPressed: () {
        Provider.of<ReserveringDetails>(context).updateKapsalonData(kapper);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KappersBehandeling())
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.data.primaryColor,
        ),
        child: Text(
          "Reserveer",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}