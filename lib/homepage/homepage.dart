/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mweather/about.dart';
import 'package:mweather/homepage/feedback.dart';
import 'package:mweather/homepage/maincontent.dart';
import 'package:mweather/weatherdata/weathercity.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:open_settings/open_settings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Geolocator geolocator = Geolocator();
  Position userLocation;
  bool flag = false;

  @override
  void initState() {
    super.initState();
    _getLocation().then((position) {
      userLocation = position;
    });
    Future.delayed(Duration(seconds: 1)).then((_) => _displaySnackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffFFF7AA),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          color: Colors.blue,
          tooltip: 'City Menu',
          iconSize: 30.0,
          icon: Icon(Icons.location_city),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => WeatherDetails(
                          spinflag: 1,
                        )));
          },
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.black,
              tooltip: 'Device Location',
              icon: Icon(
                Icons.location_searching,
              ),
              onPressed: () {
                setState(() {
                  flag = true;
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                });
              }),
          IconButton(
              color: Colors.blue,
              icon: Icon(Icons.more_vert),
              tooltip: 'Show More',
              iconSize: 30.0,
              onPressed: () {
                _showPopupMenu();
              })
        ],
        title: Center(
          child: Text(
            'mWeather',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Acme',
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: userLocation == null
          ? Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: !flag
                            ? Text(
                                'Device location not detected.',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 22.0,
                                  fontFamily: 'IndieFlower',
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                'Location Fetching...',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                    fontFamily: 'IndieFlower'),
                              ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: !flag
                            ? Text('')
                            : SpinKitDoubleBounce(
                                color: Colors.green,
                                size: 30,
                              ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/locationpermit.png',
                            height: MediaQuery.of(context).size.height - 200,
                            width: MediaQuery.of(context).size.width - 50),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : MainContent(
              latitude: userLocation.latitude.toDouble(),
              longitude: userLocation.longitude.toDouble(),
            ),
    );
  }

  void _showPopupMenu() async {
    await showMenu(
      color: Color(0xffFFEB3B),
      context: context,
      position: RelativeRect.fromLTRB(200, 80, 0, 20),
      items: [
        PopupMenuItem<String>(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.blueAccent,
                size: 25.0,
              ),
              title: Text(
                'About',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Acme', fontSize: 18.0),
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
          ),
        ),
        PopupMenuItem<String>(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => FeedbackPage()));
              },
              leading: Icon(
                Icons.feedback,
                color: Colors.blueAccent,
                size: 25.0,
              ),
              title: Text(
                'Feedback',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Acme', fontSize: 18.0),
              ),
            ),
          ),
        ),
        PopupMenuItem<String>(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              onTap: null,
              leading: Icon(
                Icons.file_download,
                color: Colors.blueAccent,
                size: 28.0,
              ),
              title: Text(
                'Clone Code',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Acme', fontSize: 18.0),
              ),
            ),
          ),
        ),
        PopupMenuItem<String>(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
                onTap: () {
                  OpenSettings.openLocationSetting();
                },
                leading: !(await Geolocator().isLocationServiceEnabled())
                    ? Icon(
                        Icons.location_off,
                        color: Colors.red,
                        size: 28.0,
                      )
                    : Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 28.0,
                      ),
                title: !(await Geolocator().isLocationServiceEnabled())
                    ? Text(
                        'Turn ON GPS',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Acme',
                            fontSize: 18.0),
                      )
                    : Text(
                        'Turn OFF GPS',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Acme',
                            fontSize: 18.0),
                      )),
          ),
        ),
        PopupMenuItem<String>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Version : 1.0.0',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
      elevation: 10.0,
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        flag = false;
      });
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  void get _displaySnackbar {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Color(0xffFFEB3B),
      elevation: 0.5,
      duration: Duration(seconds: 5),
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Welcome to mWeather',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 25.0,
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
