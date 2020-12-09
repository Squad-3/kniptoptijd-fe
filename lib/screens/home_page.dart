import 'package:flutter/material.dart';
import '../providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'location_detail/image_banner.dart';
import 'location_detail/text_section.dart';
import 'location_detail/homepage_logo.dart';
import 'location_detail/text_field.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';

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