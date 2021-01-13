import 'dart:convert';
import 'package:http/http.dart';
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/kapsalon.dart';
import 'package:kniptoptijd/models/kapsalonSearchResults.dart';

import 'dart:developer';

class GetKapsalonDetails {
  final String kapsalonUrl = 'http://192.168.50.166:5000/behandeling?idkapsalon=1';

  Future<List<Behandeling>> getBehandelingen() async {
    Response res;
    try {
      res = await post(kapsalonUrl);
    } catch (e) {
      print(e);
    }

    if(res.body != null) {
      List<dynamic> body = jsonDecode(res.body);
      List<Behandeling> behandelingen = body.map((dynamic item) => Behandeling.fromJson(item)).toList();
      log('data: $behandelingen');
      return behandelingen;
    } else {
      throw "Geen behandelingen gevonden.";
    }
  }
}