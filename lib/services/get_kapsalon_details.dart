import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/kapsalonState.dart';
import 'package:provider/provider.dart';

class GetKapsalonDetails {

  final String kapsalonUrl = 'http://192.168.50.166:5000/behandeling?idkapsalon=1';

  GetKapsalonDetails(String kapsalonId);

  Future<List<Behandeling>> fetchBehandelingen() async {
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