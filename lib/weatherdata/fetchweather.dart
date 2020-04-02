/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(var lat, var long) async {
  var key = /* "api key";   For api key visit openweather.org */
  

   final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?APPID=${key.toString()}&lat=${lat.toString()}&lon=${long.toString()}&units=metric');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Album {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;
  final double speed;
  final int pressure;
  final int sealevel;
  final double tempMax;
  final double tempMin;
  final double feelslike;
  final int humidity;
  final String description;
  final int windDirection;
  final String deg;

  Album(
      {this.name,
      this.windDirection,
      this.description,
      this.temp,
      this.date,
      this.icon,
      this.main,
      this.deg,
      this.speed,
      this.pressure,
      this.feelslike,
      this.sealevel,
      this.tempMax,
      this.tempMin,
      this.humidity});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      speed: json['wind']['speed'].toDouble(),
      deg: json['wind']['deg'].toString(),
      pressure: json['main']['pressure'],
      feelslike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      tempMax: json['main']['temp_max'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      sealevel: json['clouds']['all'].toInt(),
      description: json['weather'][0]['description'],
      windDirection: json['wind']['deg'],
    );
  }
}
