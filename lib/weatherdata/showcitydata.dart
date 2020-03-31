/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:mweather/spinkit.dart';
import 'package:mweather/weatherdata/fetchweather.dart';
import 'package:intl/intl.dart';
import 'package:mweather/weatherdata/weathercity.dart';

class ShowCityData extends StatefulWidget {
  final double latitude;
  final double longitude;

  // receive data from the FirstScreen as a parameter
  ShowCityData({Key key, @required this.latitude, @required this.longitude})
      : super(key: key);

  @override
  _ShowCityDataState createState() => _ShowCityDataState();
}

class _ShowCityDataState extends State<ShowCityData> {
  var isLoading = false;
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();

    setState(() {
      var a = widget.latitude;
      var b = widget.longitude;
      futureAlbum = fetchAlbum(a, b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff7aa),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
            tooltip: 'Back',
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pop(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => WeatherDetails(
                            spinflag: 1,
                          )));
            }),
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
      body: isLoading
          ? spinkit
          : FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView(
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/city2.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 1.0,
                                        color:
                                            Color.fromRGBO(255, 235, 59, 0.2),
                                        child: Center(
                                          child: Text(
                                            snapshot.data.name,
                                            style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 35.0,
                                              fontFamily: 'Acme',
                                              fontWeight: FontWeight.bold,
                                              backgroundColor: Color.fromRGBO(
                                                  0, 255, 255, 0.3),
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                          child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                5.0,
                                            child: Card(
                                              color: Colors.brown,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Image.asset(
                                                      'assets/wind.png',
                                                      height: 90.0,
                                                      width: 90.0,
                                                      color: Colors.yellow,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${(snapshot.data.speed * 2.23694).toStringAsFixed(0)} mph',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Acme'),
                                                  ),
                                                  Text(
                                                    '${snapshot.data.windDirection.toString()} degree',
                                                    style: TextStyle(
                                                        color: Colors.yellow,
                                                        fontSize: 18.0,
                                                        fontFamily: 'Acme'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                5.0,
                                            child: Card(
                                              color: Colors.red,
                                              child: Center(
                                                  child: PageView(
                                                pageSnapping: true,
                                                scrollDirection: Axis.vertical,
                                                children: <Widget>[
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.0,
                                                            vertical: 10.0),
                                                    color: Colors.red,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Image.asset(
                                                            'assets/temperature.png',
                                                            color: Colors.black,
                                                            height: 70,
                                                            width: 50),
                                                        Center(
                                                          child: Text(
                                                            '${snapshot.data.temp.toStringAsFixed(0)} °C',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 40.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontFamily:
                                                                    'Acme'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.black54,
                                                    child: Center(
                                                      child: Text(
                                                        " ${((snapshot.data.temp.toDouble() * 9 / 5) + 32).toStringAsFixed(0)} °F",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 40.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontFamily: 'Acme'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  5.0,
                                              child: Card(
                                                color: Colors.pink,
                                                child: Center(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Image.network(
                                                        'https://openweathermap.org/img/w/${snapshot.data.icon}.png',
                                                        height: 90.0,
                                                        width: 90.0,
                                                      ),
                                                      Text(
                                                        '${snapshot.data.main}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          fontFamily: 'Acme',
                                                        ),
                                                      ),
                                                      Text(
                                                        '${snapshot.data.description}',
                                                        style: TextStyle(
                                                          color: Colors.yellow,
                                                          fontFamily: 'Acme',
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  5.0,
                                              child: Card(
                                                color: Colors.blue,
                                                child: Center(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Icon(
                                                          Icons.date_range,
                                                          size: 80.0,
                                                          color: Colors.brown,
                                                        ),
                                                      ),
                                                      Text(
                                                        new DateFormat.Hm()
                                                            .format(snapshot
                                                                .data.date),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          height: 1.0,
                                                          fontSize: 20.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${DateFormat.yMMMd().format(snapshot.data.date)}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      padding: EdgeInsets.all(2.0),
                                      child: Card(
                                        color: Color(0xfff44235),
                                        elevation: 2.0,
                                        child: Center(
                                          child: Text(
                                            'Detailed Information',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontFamily: 'IndieFlower',
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        color: Colors.white,
                                        child: Container(
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/back4.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                    'Humidity: \n${snapshot.data.humidity.toString()}%',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Acme',
                                                      letterSpacing: 1.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Feels Like:\n ${snapshot.data.feelslike.toString()} °C',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Acme',
                                                      letterSpacing: 1.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Pressure:\n ${snapshot.data.pressure.toString()} hPa',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Acme',
                                                      letterSpacing: 1.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        color: Colors.white,
                                        child: Container(
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/back2.jpg'),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                    'Min Temp: \n${snapshot.data.tempMin.toString()} °C',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Acme',
                                                      letterSpacing: 1.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Max Temp:\n ${snapshot.data.tempMax.toString()} °C',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Acme',
                                                      letterSpacing: 1.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Clouds:\n ${snapshot.data.sealevel.toString()} %',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Acme',
                                                      letterSpacing: 1.0,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(" It seems that you have no Internet."));
                }

                // By default, show a loading spinner.
                return spinkit;
              },
            ),
    );
  }
}
