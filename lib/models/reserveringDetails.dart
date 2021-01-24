import 'package:flutter/material.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class ReserveringDetails extends ChangeNotifier {
  dynamic kapsalonData;
  dynamic behandelingsData = [];
  dynamic gekozenKapper;

  // dynamic searchInput = '';
  // String dateInput;
  // String timeInput;

  void updateKapsalonData(Kapsalon input) {
    kapsalonData = input;
    notifyListeners();
  }
  
  void updateBehandelingsData(int input) {
    if(behandelingsData.contains(input)) {
      behandelingsData.remove(input);
    }
    else{
      behandelingsData.add(input);
    }
    behandelingsData.sort();
    notifyListeners();
  }
  void updateGekozenKapper(String input) {
    gekozenKapper = input;
  }
  // void updateSearchInput(String input){
  //   searchInput = input;
  //   notifyListeners();
  // }
  // void updateSelectedDate(String input){
  //   dateInput = input;
  // }
  // void updateSelectedTime(String input){
  //   timeInput = input;
  // }
}

