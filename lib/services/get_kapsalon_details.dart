import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:provider/provider.dart';

class GetKapsalonDetails {

@override
  Future<List<Behandeling>> fetchBehandelingen(kapsalonId) async {

    final String kapsalonUrl = 'http://192.168.50.166:5000/behandeling?kapsalonid=' + kapsalonId.toString();
    print('kapsalonId = ' + kapsalonId.toString());
    final response = await http.get(
      kapsalonUrl
    );

    if(response.body != null) {
      List<dynamic> body = jsonDecode(response.body);
      List<Behandeling> behandelingen = body.map((dynamic item) => Behandeling.fromJson(item)).toList();
      return behandelingen;
    } else {
      throw "Geen behandelingen gevonden.";
    }

  }
}