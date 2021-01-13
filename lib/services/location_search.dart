import 'dart:convert';
import 'package:http/http.dart';
import 'package:kniptoptijd/models/kapsalon.dart';

class get_kapsalon_details {
  final String locationUrl = 'http://192.168.50.166:5000/locatie?locatie=utrecht';

  Future<List<Kapsalon>> getKappers() async {
    Response res;
    try {
      res = await post(locationUrl);
    } catch (e) {
      print(e);
    }

    if(res.body != null) {
      List<dynamic> body = jsonDecode(res.body);
      List<Kapsalon> kappers = body.map((dynamic item) => Kapsalon.fromJson(item)).toList();
      return kappers;
    } else {
      throw "Geen kappers gevonden.";
    }
  }
}