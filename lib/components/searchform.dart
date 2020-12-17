import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kniptoptijd/screens/kapper_list/kapper_list.dart';
import 'package:kniptoptijd/services/location_search.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _SearchFormState extends State<SearchForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final searchController = TextEditingController();
  static var test = LocationSearch();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: '\'1234AB, Amsterdam\' om 12 uur',
        hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[300]),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        suffixIcon: IconButton(
            // onPressed: () => test.getKappers(searchController.text),
            // onPressed: () => KapperList(searchController.text),
            icon: Icon(Icons.search, color: Colors.white)
        ),
      ),
    );
  }
}