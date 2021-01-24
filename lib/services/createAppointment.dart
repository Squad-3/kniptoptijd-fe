import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kniptoptijd/models/behandeling.dart';
import 'package:kniptoptijd/models/contactGegevens.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:kniptoptijd/models/searchQueries.dart';
import 'package:kniptoptijd/screens/bevestiging_mail.dart';
import 'package:provider/provider.dart';

class CreateAppointment {

@override
  postAppointment(BuildContext context) async {
  var reservering = Provider.of<ReserveringDetails>(context);
  var search = Provider.of<SearchQueries>(context);
  var contactGegevens = Provider.of<ContactGegevens>(context);


    final String afspraakUrl = 'http://192.168.50.166:5000/afspraak';
    final response = await http.post(
      afspraakUrl,
      body: {
        'kapsalon': reservering.kapsalonData.kapperId,
        'kapper': reservering.gekozenKapper,
        'behandeling': reservering.behandelingsData[0],
        'dag': search.dateInput,
        'tijd': search.timeInput,
        'klant': contactGegevens.contactNaam,
        'klantemail': contactGegevens.contactEmail,
        'klanttelefoon': contactGegevens.contactTelefoon,
      }
    );
    print('afspraak wordt gemaakt');

    if(response.body != null) {
      print('afpsraak niet kunnen aanmaken.');
    } else {
      print('afpsraak succesvol aangemaakt,');
    }

  }
}