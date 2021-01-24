import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class ContactGegevens extends ChangeNotifier {
  String contactNaam = ' ';
  String contactEmail = ' ';
  String contactTelefoon = ' ';

  void updateContactGegevens(String naam, String email, String telefoon) {
      contactNaam = naam;
      contactEmail = email;
      contactTelefoon = telefoon;
      notifyListeners();
  }
}
