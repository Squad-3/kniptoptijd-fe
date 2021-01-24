import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class SearchQueries extends ChangeNotifier {
  static DateTime dateTime = new DateTime.now();
  String searchInput = 'utrecht';
  String dateInput = dateTime.day.toString() + '/' + dateTime.month.toString();
  String timeInput = TimeOfDay.now().hour.toString() + ':' + TimeOfDay.now().minute.toString();

  void updateSearchInput(String input) {
    if(input != '') {
      searchInput = input;
      notifyListeners();
    }
  }

  void updateSelectedDate(String input) {
    if(input != '') {
      dateInput = input;
      notifyListeners();
    }
  }

  void updateSelectedTime(String input) {
    if(input != '') {
      timeInput = input;
      notifyListeners();
    }
  }
}
