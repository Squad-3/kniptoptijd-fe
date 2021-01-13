import 'dart:convert';
import 'package:http/http.dart';
import 'package:kniptoptijd/models/kapper.dart';

class LocationSearch {
  final String locationUrl = 'http://10.0.2.2:5000/locatie?locatie=utrecht';

  Future<List<Kapper>> getKappers() async {
    Response res;
    try {
      res = await post(locationUrl);
    } catch (e) {
      print(e);
    }

    if(res.body != null) {
      List<dynamic> body = jsonDecode(res.body);
      List<Kapper> kappers = body.map((dynamic item) => Kapper.fromJson(item)).toList();
      return kappers;
    } else {
      throw "Geen kappers gevonden.";
    }
  }
}