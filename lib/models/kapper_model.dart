import 'package:flutter/foundation.dart';

class Kapper {
  final int kapperId;
  final String logo;
  final String naam;
  final String openingstijden;
  final String postcode;
  final String stad;
  final String straatnaam;

  Kapper({
    @required this.kapperId,
    this.logo,
    this.naam,
    this.openingstijden,
    this.postcode,
    this.stad,
    this.straatnaam
  });

  factory Kapper.fromJson(Map<String, dynamic> json) {
    return Kapper(
      kapperId: json['kapperId'] as int,
      logo: json['logo'] as String,
      naam: json['naam'] as String,
      openingstijden: json['openingstijden'] as String,
      postcode: json['postcode'] as String,
      stad: json['stad'] as String,
      straatnaam: json['straatnaam'] as String,
    );
  }

}