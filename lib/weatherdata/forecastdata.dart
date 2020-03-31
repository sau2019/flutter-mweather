
/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/


 class ForecastData {
  
  final DateTime date;
  final String main;
  final double temp;
  final double wind;
  

  ForecastData({this.date,this.main,this.temp,this.wind});

 
}

/*
Future<Forecast> fetchForecast(var lat, var lng) async {

  var key="c4497e0d102ffa57f370d5894fe96e87";



  final response =  await http.get('https://api.openweathermap.org/data/2.5/forecast?APPID=${key.toString()}lat=${lat.toString()}&lon=${lng.toString()}&units=metric');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Forecast.fromJson(json.decode(response.body));
  } else {
     // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

*/