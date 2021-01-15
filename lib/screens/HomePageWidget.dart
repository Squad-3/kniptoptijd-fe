import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  TextEditingController _controller3;
  TextEditingController _controller4;

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
                image: AssetImage('assets/images/pic.jpg'),
                fit: BoxFit.fill,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90.h,
              ),
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/pic1.png'),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text('KNIPTOPTIJD',
                  style: TextStyle(
                      letterSpacing: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(55))),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.grey[300]),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      hintText: 'Zoek op postcode, plaatsnaam',
                      hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
                        height: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey[300]),
                        child: DateTimePicker(
                          decoration: InputDecoration(
                            hintText: 'Datum',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30)),
                            suffixIcon: Icon(
                              Icons.event,
                              color: Colors.black,
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
                          onSaved: (val) => setState(() => _valueSaved3 = val),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey[300]),
                        child: DateTimePicker(
                          decoration: InputDecoration(
                            hintText: 'Tijd',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(32)),
                            suffixIcon: Icon(
                              Icons.access_time,
                              color: Colors.black,
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
                          onChanged: (val) =>
                              setState(() => _valueChanged4 = val),
                          validator: (val) {
                            setState(() => _valueToValidate4 = val);
                            return null;
                          },
                          onSaved: (val) => setState(() => _valueSaved4 = val),
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
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                            'VIND',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(28),
                                color: Colors.grey[300]),
                          )),
                      height: 60.h,
                      width: 166.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
