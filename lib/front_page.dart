/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:mweather/checkconnection.dart';
import 'dart:async';

import 'package:mweather/spinkit.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  var isloading = false;

  @override
  void initState() {
    super.initState();

    isloading = true;

    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CheckConnection())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'assets/wicon.gif',
                      fit: BoxFit.fill,
                      height: 300,
                      width: 300.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'mWeather',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    wordSpacing: 1.5,
                    fontSize: 32.0,
                    fontFamily: 'Acme',
                    height: 5.0,
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: spinkitload,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
