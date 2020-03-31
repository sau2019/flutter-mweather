/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Icon(
                  Icons.signal_wifi_off,
                  size: 150.0,
                  color: Colors.yellow,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Try connecting to an internet or restart the application.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
