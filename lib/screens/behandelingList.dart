import 'package:flutter/material.dart';
import 'package:kniptoptijd/components/button.dart';
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/kapsalon.dart';
import 'package:kniptoptijd/models/kapsalonBehandelingen.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:provider/provider.dart';

// CheckboxListTile renderBehandelingList(Behandeling behandeling, BuildContext context) {
//   var reserveringsDetails = Provider.of<ReserveringDetails>(context);
//   bool _isSelected = false;
//
//   return CheckboxListTile(
//
//     value: false,
//     onChanged: (bool newValue) {
//       reserveringsDetails.updateBehandelingsData(behandeling.behandelingID);
//       print(reserveringsDetails.behandelingsData);
//       setState(() {
//         _isSelected = newValue;
//       });
//     },
//     title: Text(behandeling.naam),
//     subtitle: Text(behandeling.prijs),
//     isThreeLine: true,
//   );
//
// }

class RenderBehandelingList extends StatefulWidget {
  final Behandeling behandeling;
  const RenderBehandelingList(this.behandeling);

  @override
  _RenderBehandelingListState createState() => _RenderBehandelingListState();
}

class _RenderBehandelingListState extends State<RenderBehandelingList> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    var reserveringsDetails = Provider.of<ReserveringDetails>(this.context);
    var behandeling = widget.behandeling;
    return CheckboxListTile(
      title: Text(behandeling.naam),
      subtitle: Text(behandeling.prijs),
      value: _value,
      onChanged: (bool value) {
        setState(() {
          _value = value;
          reserveringsDetails.updateBehandelingsData(behandeling.behandelingID);
          print(reserveringsDetails.behandelingsData);
        });
      },
    );
  }
}

