/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:mweather/checkconnection.dart';
import 'dart:async';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    super.initState();

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
            image: AssetImage('assets/frontbanner.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 45,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 70,
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Image.asset('assets/appicon.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                'mWeather',
                style: TextStyle(
                    color: Color(0xffF4B753),
                    fontSize: 22,
                    letterSpacing: 1.0,
                    fontFamily: 'Acme'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
