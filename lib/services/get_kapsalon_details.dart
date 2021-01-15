import 'dart:convert';
import 'package:http/http.dart';
import 'package:kniptoptijd/models/kapper.dart';
import 'package:kniptoptijd/models/kapsalons.dart';

class GetKapsalonDetails {
  final String kapsalonUrl = 'http://192.168.50.166:5000/behandeling?idkapsalon=1';

  Future<List<Kapper>> getKappers() async {
    Response res;
    try {
      res = await post(kapsalonUrl);
    } catch (e) {
      print(e);
    }

    if(res.body != null) {
      List<dynamic> body = jsonDecode(res.body);
      List<dynamic> behandelingen = body.map((dynamic item) => Kapsalons.fromJson(item)).toList();
      return behandelingen;
    } else {
      throw "Geen behandelingen gevonden.";
    }
  }
}