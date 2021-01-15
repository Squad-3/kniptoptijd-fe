import 'package:flutter/material.dart';

class Kapsalons extends ChangeNotifier {
  List kapsalons = [];

  Kapsalons({
    @required this.kapsalons,
  });

  factory Kapsalons.fromJson(Map<String, dynamic> json) {
    return Kapsalons(
      kapsalons: json['kapsalons'] as List,
    );
  }

  void updateKapsalons(input) {
    kapsalons = input;
  }
}