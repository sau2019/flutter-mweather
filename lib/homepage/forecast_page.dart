/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mweather/modal/forecastitem.dart';
import 'package:mweather/modal/forecastmodal.dart';
import 'package:mweather/spinkit.dart';

class ForecastPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  ForecastPage({Key key, @required this.latitude, @required this.longitude})
      : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  bool isLoading = false;
  ForecastData forecastData;
  var a;
  var b;
  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
      a = widget.latitude;
      b = widget.longitude;
    });

    loadWeather(a, b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Container(
              child: spinkit,
            )
          : Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 3.0,
                        child: Image.asset(
                          'assets/forecastbanner.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: forecastData != null
                        ? ListView.builder(
                            itemCount: forecastData.list.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ForecastItem(
                                weather: forecastData.list.elementAt(index)),
                          )
                        : Text('data fetching'),
                  ),
                ],
              ),
            ),
    );
  }

  loadWeather(final lat, final lon) async {
    setState(() {
      isLoading = true;
    });

    try {
      var key = "c4497e0d102ffa57f370d5894fe96e87";

      final forecastResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=${key.toString()}&lat=${lat.toString()}&lon=${lon.toString()}&units=metric');

      if (forecastResponse.statusCode == 200) {
        return setState(() {
          forecastData =
              new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    } catch (e) {
      return 'error';
    }
  }
}
