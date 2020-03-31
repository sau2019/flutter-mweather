/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mweather/homepage/homepage.dart';
import 'package:mweather/spinkit.dart';
import 'package:mweather/weatherdata/showcitydata.dart';
import 'cityclass.dart';

class WeatherDetails extends StatefulWidget {
  final int spinflag;
  WeatherDetails({Key key, @required this.spinflag}) : super(key: key);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  bool isLoading = false;

  var cityname = const [];
  var cityfilter = const [];

  Future loadCityList() async {
    String content = await rootBundle.loadString('jsoncitylist/citylist.json');
    List decodedcontent = json.decode(content);

    List<Citylist> _citylist =
        decodedcontent.map((json) => Citylist.fromJson(json)).toList();

    setState(() {
      isLoading = false;
      cityname = _citylist;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    loadCityList();

    setState(() {
      cityfilter = cityname;
    });
  }

  TextEditingController controller = new TextEditingController();

  Icon search = Icon(Icons.search);

  Widget apptitle = Text(
    'mWeather',
    style: TextStyle(
      color: Colors.black,
      fontFamily: 'Acme',
      fontSize: 25.0,
    ),
    textAlign: TextAlign.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffFFF7AA),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          color: Colors.blue,
          tooltip: 'Back Home',
          iconSize: 30.0,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.blue,
              icon: search,
              iconSize: 30.0,
              onPressed: () {
                if (this.search.icon == Icons.search) {
                  setState(() {
                    if (this.search.icon == Icons.search) {
                      this.search = Icon(Icons.cancel);
                      this.apptitle = TextField(
                        textInputAction: TextInputAction.go,
                        textAlign: TextAlign.justify,
                        onChanged: (string) {
                          setState(() {
                            cityfilter = cityname
                                .where((u) => (u.cityname
                                    .toLowerCase()
                                    .contains(string.toLowerCase())))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your city name',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontFamily: 'Acme',
                          fontStyle: FontStyle.normal,
                        ),
                        controller: controller,
                        textDirection: TextDirection.ltr,
                      );
                    }
                  });
                }
                if (this.search.icon != Icons.search) {
                  setState(() {
                    controller.clear();
                  });
                }
              }),
        ],
        title: Center(
          child: apptitle,
        ),
      ),
      body: isLoading
          ? spinkit
          : ListView.builder(
              itemCount: cityfilter.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                Citylist citylist = cityfilter[index];

                return Container(
                  margin: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowCityData(
                                  latitude: citylist.lat,
                                  longitude: citylist.long),
                            )),
                        child: new Card(
                          color: Color(0xfffff7aa),
                          elevation: 3.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50.0,
                            margin: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Color(0xffd8e9ed),
                                      child: Text(citylist.country,
                                          style: TextStyle(
                                            color: Colors.pink,
                                          )),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      citylist.cityname,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 22.0,
                                        fontFamily: 'Acme',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Color(0xfffffcdd),
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.cyan,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
