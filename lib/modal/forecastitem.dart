import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mweather/modal/forecastmodal.dart';
import 'package:weather_icons/weather_icons.dart';

class ForecastItem extends StatelessWidget {
  final WeatherData weather;

  ForecastItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
  
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          height: 250,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow,
                              radius: 20,
                              child: Text(
                                'Day',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Text(
                                new DateFormat.yMMMd().format(weather.date),
                                style: new TextStyle(
                                  color: Colors.brown,
                                  fontFamily: 'Acme',
                                  fontSize: 18,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child:
                                Text(new DateFormat.Hm().format(weather.date),
                                    style: new TextStyle(
                                      color: Colors.brown,
                                      fontFamily: 'Acme',
                                      fontSize: 18,
                                    )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: BoxedIcon(
                                WeatherIcons.wind,
                                size: 40,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              '${(weather.speed * 2.23694).toStringAsFixed(0)} mph',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Acme'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25,
                              ),
                              child: BoxedIcon(
                                WeatherIcons.thermometer,
                                size: 30,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              height: 50,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child: Text(
                                        ' ${weather.temp.toStringAsFixed(0)} °C',
                                        style: TextStyle(
                                            color: Color(0xff4E4D3F),
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Acme'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor:Color(0xff4E4D3F),
                                      radius: 30,
                                      child: Text(
                                        ' ${((weather.temp.toDouble() * 9 / 5) + 32).toStringAsFixed(0)} °F',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Acme'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Image.network(
                              'https://openweathermap.org/img/w/${weather.icon}.png',
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              weather.main,
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 22,
                                  fontFamily: 'Acme'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: PageView(
                children: <Widget>[
                  Container(
                    color: Colors.cyan,
                    child: Center(
                        child: ListTile(
                      leading: BoxedIcon(
                        WeatherIcons.humidity,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'Humidity',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 1.0),
                      ),
                      trailing: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text(
                          '${weather.humidity.toString()}%',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )),
                  ),
                  Container(
                    color: Colors.cyan,
                    child: Center(
                        child: ListTile(
                      leading: BoxedIcon(
                        WeatherIcons.thermometer_exterior,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        ' Min Temperature',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1.0,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text(
                          '${weather.tempMin.toStringAsFixed(0)} °C',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )),
                  ),
                  Container(
                    color: Colors.cyan,
                    child: Center(
                        child: ListTile(
                      leading: BoxedIcon(
                        WeatherIcons.thermometer_exterior,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        ' Max Temperature',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1.0,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text(
                          '${weather.tempMax.toStringAsFixed(0)} °C',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
