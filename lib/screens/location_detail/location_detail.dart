import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'text_section.dart';
import 'homepage_logo.dart';
import 'text_field.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageBanner("assets/images/kiyomizu-dera.jpg"),
          TextSection("KNIPTOPTIJD", "Vind"),
          Container(
            child: tijdInput(),
            margin: const EdgeInsets.only(left: 20.0, top: 250.0, bottom: 200.0, right: 20.0),
          ),
          Container(
            child: MyLogo(),
            height: 260.0,
            width: 500.0,
          ),
        ],
      )
    );
  }
}