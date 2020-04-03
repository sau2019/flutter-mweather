class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;
  final double speed;
  final double tempMax;
  final double tempMin;
  final int humidity;


  WeatherData({this.date, this.name, this.temp, this.main, this.icon, this.speed,this.tempMax, this.tempMin,this.humidity });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      speed: json['wind']['speed'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      humidity: json['main']['humidity'],

    );
  }
}

class ForecastData {
  final List list;

  ForecastData({this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData(
          date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
          name: json['city']['name'],
          temp: e['main']['temp'].toDouble(),
          main: e['weather'][0]['main'],
          icon: e['weather'][0]['icon'],
          speed: e['wind']['speed'].toDouble(),
          tempMax: e['main']['temp_max'].toDouble(),
          tempMin: e['main']['temp_min'].toDouble(),
          humidity: e['main']['humidity'],
         
          );
      list.add(w);
    }

    return ForecastData(
      list: list,
    );
  }
}