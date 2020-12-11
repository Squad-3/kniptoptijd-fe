import 'dart:convert';

import 'package:http/http.dart';
import 'package:kniptoptijd/models/kapper_model.dart';

class LocationSearch {
  final String locationurl = 'http://10.0.2.2:5000?stad=utrecht&straatnaam=straat';

  Future<List<Kapper>> getKappers() async {
    Response res = await post(locationurl);

    if(res.body != null) {
      print(res.body);
      List<dynamic> body = jsonDecode(res.body);
      List<Kapper> kappers = body.map((dynamic item) => Kapper.fromJson(item)).toList();
      print(kappers[0]);
      return kappers;
    } else {
      throw "Geen kappers gevonden.";
    }
  }
}