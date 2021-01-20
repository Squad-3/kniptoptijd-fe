import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class LocationSearch {
  final String locationUrl ='http://192.168.50.166:5000/locatie?locatie=utrecht';

  Future<List<Kapsalon>> getKappers() async {
    Response res;
    try {
      res = await get(
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