import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'text_section.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ImageBanner("assets/images/kiyomizu-dera.jpg"),
        TextSection("KNIPTOPTIJD", "Vind"),
      ],
    ));
  }
}
