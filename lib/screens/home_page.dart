import 'package:flutter/material.dart';
import 'package:kniptoptijd/screens/HomePageWidget.dart';
import '../providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'location_detail/image_banner.dart';
import 'location_detail/text_section.dart';
import 'location_detail/homepage_logo.dart';
import 'location_detail/text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'NavigationView.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      allowFontScaling: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.red,
          cursorColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePageWidget(),
      ),
    );
  }
}