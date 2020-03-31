/*
Auther: S.Ranjan Kr.
Date: 31st March,2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './front_page.dart';

Future main() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(new MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'mWeather',
      home:FrontPage(),
    );
  }
}
