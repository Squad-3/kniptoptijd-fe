import 'package:flutter/foundation.dart';

class Behandeling {
  final int behandelingID;
  final int kapperID;
  final String naam;
  final String prijs;
  final String voornaam;
  final String werkdagen;

  Behandeling({
    @required this.behandelingID,
    this.kapperID,
    this.naam,
    this.prijs,
    this.voornaam,
    this.werkdagen,
  });

  factory Behandeling.fromJson(Map<String, dynamic> json) {
    return Behandeling(
      behandelingID: json['behandelingID'] as int,
      kapperID: json['kapperID'] as int,
      naam: json['naam'] as String,
      prijs: json['prijs'] as String,
      voornaam: json['voornaam'] as String,
      werkdagen: json['werkdagen'] as String,
    );
  }

}