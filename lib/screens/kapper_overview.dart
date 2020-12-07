import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'kapper_list/kapper_list.dart';

class KapperOverview extends StatefulWidget {
  static const route = '/overview';
  KapperOverview({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _KapperOverviewState createState() => _KapperOverviewState();
}

class _KapperOverviewState extends State<KapperOverview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/scaffold-bg.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment(-1.0, -1.0)
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 30),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: '\'1234AB, Amsterdam\' om 12 uur',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[300]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
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
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Zoekresultaten voor:',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                      ),
                                      Text(
                                        '1234AB, Amsterdam om 12 uur',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Expanded(
                          child: KapperList()
                      ),
                    ],
                  ),
              ),
            ),
          ]
      ),
    );
  }
}