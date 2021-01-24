
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:kniptoptijd/models/searchQueries.dart';
import 'package:kniptoptijd/screens/behandeling_overview.dart';
import 'package:kniptoptijd/services/createAppointment.dart';
import 'package:provider/provider.dart';

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
    var reservering = Provider.of<ReserveringDetails>(context);
    var search = Provider.of<SearchQueries>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/hakan_banner.png"), //path veranderen voor een andere image/swoosh
                      fit: BoxFit.contain,
                      alignment: Alignment(-1.0, -1.0)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              iconSize: 32,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              reservering.kapsalonData.naam,
                              style: TextStyle(
                                fontSize: 24.0, color: Colors.white, fontFamily: 'Quicksand', fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            //styling geven aan een container, dmv boxdecoration desnoods flutter boxdecoration opzoeken
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0),
                                bottom: Radius.zero,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 24.0,
                                  spreadRadius: 4.0,
                                )
                              ]),
                            child: SingleChildScrollView(
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
                                                    fontSize: ScreenUtil().setSp(52),
                                                fontFamily: 'Quicksand',
                                                fontWeight: FontWeight.bold),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 4.5,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 25,
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 9,
                                                ),
                                              )
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
                                        fontSize: ScreenUtil().setSp(35),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0.h, horizontal: 99.w),
                                    child: Column(
                                      children: [
                                        AutoSizeText(
                                        search.dateInput + ' om ' + search.timeInput,
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(30),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                        AutoSizeText(
                                        'bij ' + reservering.kapsalonData.naam + '.',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(30),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                        AutoSizeText(
                                          'U wordt geholpen door: ' + reservering.gekozenKapper,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(30),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtil().screenHeight * .25,
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
                            ),
                        ),
                    ],
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