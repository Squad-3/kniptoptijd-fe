
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:kniptoptijd/screens/behandeling_overview.dart';

class BevestigingsMail extends StatefulWidget {
  static const route = '/';
  @override
  _BevestigingsMailState createState() => _BevestigingsMailState();
}
class _BevestigingsMailState extends State<BevestigingsMail> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(52.078079, 5.095087),
    zoom: 14.4746,
  );
  GoogleMapController newGoogleMapController;
  Position currentPosition;
  var geolocator = Geolocator();
  double bottomPaddingOfMap = 0;
  void locationPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
    new CameraPosition(target: LatLng(52.078079, 5.095087), zoom: 15);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: ScreenUtil().screenHeight * .25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/kapper_hakan.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    height: ScreenUtil().screenHeight * .62,
                    child: GoogleMap(
                      initialCameraPosition: _kGooglePlex,
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      onMapCreated: (controller) {
                        _controllerGoogleMap.complete(controller);
                        newGoogleMapController = controller;
                        locationPosition();
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 180.h,
                left: 5.w,
                right: 5.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: ScreenUtil().screenWidth * 1,
                    height: ScreenUtil().screenHeight * .54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height:
                                        ScreenUtil().screenHeight * .01),
                                    Text(
                                      'Kapper Hakan',
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(52)),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 19,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 8.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                        height:
                                        ScreenUtil().screenHeight * .01),
                                    Container(
                                      height: ScreenUtil().screenHeight * .11,
                                      width: ScreenUtil().screenWidth * .21,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/image1.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                              height: ScreenUtil().screenHeight * .15,
                              width: ScreenUtil().screenWidth * 1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                      AssetImage('assets/images/image.png'),
                                      fit: BoxFit.contain)),
                              child: Container(
                                  height: ScreenUtil().screenHeight * .12,
                                  width: ScreenUtil().screenWidth * .1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/image2.png'),
                                    ),
                                  ))),
                        ),
                        AutoSizeText(
                          'Uw afspraak is bevestigd, u heeft een e-mail ontvangen',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(65),
                              color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 99.w),
                          child: AutoSizeText(
                            'Kapper Hakan 19 november 2020 om 14:30 Knippen man bij Bert',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(37),
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}