/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mweather/weatherdata/forecastdata.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ForecastPage extends StatefulWidget {
  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  var isLoading = false;

  Future<List<ForecastData>> _fetchforecast(double lat, double lng) async {
    var key = 'c4497e0d102ffa57f370d5894fe96e87';
    var data = await http.get(
        'https://api.openweathermap.org/data/2.5/forecast?APPID=${key.toString()}lat=${lat.toString()}&lon=${lng.toString()}&units=metric');
    var jsonData = json.decode(data.body);

    List<ForecastData> forecast = [];

    for (var u in jsonData) {
      ForecastData forecastdata = ForecastData(
          date: new DateTime.fromMillisecondsSinceEpoch(u["list"]["dt"] * 1000,
              isUtc: false),
          main: u["list"]["main"]["feels_like"],
          temp: u["list"]["main"]["temp"].toDouble(),
          wind: u["list"]["wind"]["speed"].toDouble());
      forecast.add(forecastdata);
    }
    return forecast;
  }

  var a = 27.789;
  var b = 45.908;

  @override
  void initState() {
    super.initState();
    _fetchforecast(a, b);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
         Row(
            children: <Widget>[
              Center(child: SpinKitCircle(color: Colors.grey,)),
            ],
          ),
        
        Row(
          children: <Widget>[
            Text( 'Loading Forecast Data',textAlign: TextAlign.center,),
          ],
        ),
      
      ],
    );
  }
}
