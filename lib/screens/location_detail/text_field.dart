import 'package:flutter/material.dart';

TextField tijdInput(){
  return TextField(
    obscureText: false,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Zoek op postcode, plaatsnaam',
    ),
  );
}