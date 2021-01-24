import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class LocationSearch {

  Future<List<Kapsalon>> getKappers(searchInput) async {

    final String locationUrl ='http://192.168.50.166:5000/locatie?locatie=' + searchInput;

    Response res;
    try {
      res = await post(
          locationUrl
      );
    } catch (e) {
      print(e);
    }

    if(res.body != null) {
      log(res.body.toString());
      List<dynamic> body = jsonDecode(res.body);
      List<Kapsalon> kappers = body.map<Kapsalon>((dynamic item) => Kapsalon.fromJson(item)).toList();
      return kappers;
    } else {
      throw "Geen kappers gevonden.";
    }
  }
}