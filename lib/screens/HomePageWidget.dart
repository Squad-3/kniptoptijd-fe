import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kniptoptijd/models/reserveringDetails.dart';
import 'package:kniptoptijd/models/searchQueries.dart';
import 'package:kniptoptijd/providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import '../theme.dart' as Theme;

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  // ignore: unused_field
  String _valueChanged3 = '';
  // ignore: unused_field
  String _valueToValidate3 = '';
  // ignore: unused_field
  String _valueSaved3 = '';
  // ignore: unused_field
  String _valueChanged4 = '';
  // ignore: unused_field
  String _valueToValidate4 = '';
  // ignore: unused_field
  String _valueSaved4 = '';
  final zoekveldController = TextEditingController();
  TextEditingController _controller3;
  TextEditingController _controller4;

  NavigationProvider navigationProvider = NavigationProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: ScreenUtil().screenWidth * 1,
          height: ScreenUtil().screenHeight * 1,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill,
              )),
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/pic1.png'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: Text('KNIPTOPTIJD',
                      style: TextStyle(
                        letterSpacing: 9,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(50),
                        fontFamily: 'Quicksand',
                      )),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Theme.ThemeColors.secondary[500]),
                    child: TextFormField(
                      controller: zoekveldController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        hintText: 'Zoek op postcode, plaatsnaam',
                        hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                      ),
                      validator: (val) {
                        return val.length != 0 ? null : "Please fill the field";
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Theme.ThemeColors.secondary[500]),
                          child: DateTimePicker(
                            decoration: InputDecoration(
                              hintText: 'Datum',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: ScreenUtil().setSp(25),
                                fontFamily: 'Quicksand',
                              ),
                              suffixIcon: Icon(
                                Icons.event,
                                color: Colors.white,
                                size: 24,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                            ),
                            type: DateTimePickerType.date,
                            dateMask: 'yyyy/MM/dd',
                            controller: _controller3,
                            //initialValue: _initialValue,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),

                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(26)),
                            //locale: Locale('en', 'US'),
                            onChanged: (val) =>
                                setState(() => _valueChanged3 = val),
                            validator: (val) {
                              setState(() => _valueToValidate3 = val);
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _valueSaved3 = val),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Theme.ThemeColors.secondary[500]),
                          child: DateTimePicker(
                            decoration: InputDecoration(
                              hintText: 'Tijd',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: ScreenUtil().setSp(25),
                                fontFamily: 'Quicksand',
                              ),
                              suffixIcon: Icon(
                                Icons.access_time,
                                color: Colors.white,
                                size: 24,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                            ),
                            type: DateTimePickerType.time,
                            textAlign: TextAlign.center,
                            controller: _controller4,
                            //initialValue: _initialValue,

                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(26)),
                            use24HourFormat: true,
                            //locale: Locale('en', 'US'),
                            onChanged: (val) {
                              setState(() => _valueChanged4 = val);
                            },

                            validator: (val) {
                              setState(() => _valueToValidate4 = val);
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _valueSaved4 = val),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: ButtonTheme(
                            padding: EdgeInsets.all(0),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minWidth: double.infinity,
                            height: 0,
                            child: FlatButton(
                              onPressed: () {
                                Provider.of<NavigationProvider>(context, listen: false).setTab(1);
                                Provider.of<NavigationProvider>(context, listen: false).setOrigin(0);
                                Provider.of<SearchQueries>(context).updateSearchInput(zoekveldController.text);
                                Provider.of<SearchQueries>(context).updateSelectedDate(_valueChanged3.toString());
                                Provider.of<SearchQueries>(context).updateSelectedTime(_valueChanged4.toString());
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "Zoeken",
                                    style: TextStyle(
                                      color: Theme.theme.primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
