import 'package:flutter/foundation.dart';

class Kapsalon {
  final int kapperId;
  final String logo;
  final String naam;
  final String openingstijden;
  final String postcode;
  final String stad;
  final String straatnaam;

  Kapsalon({
    @required this.kapperId,
    this.logo,
    this.naam,
    this.openingstijden,
    this.postcode,
    this.stad,
    this.straatnaam
  });

  factory Kapsalon.fromJson(Map<String, dynamic> json) {
    return Kapsalon(
      kapperId: json['kapsalonID'] as int,
      logo: json['logo'] as String,
      naam: json['naam'] as String,
      openingstijden: json['openingstijden'] as String,
      postcode: json['postcode'] as String,
      stad: json['stad'] as String,
      straatnaam: json['straatnaam'] as String,
    );
  }

}