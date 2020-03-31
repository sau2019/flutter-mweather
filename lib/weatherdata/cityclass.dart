/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/
class Citylist{

  final String cityname;
  final String country;
  final double lat;
  final double long;

  Citylist({this.cityname, this.lat, this.country, this.long});
    
  Citylist.fromJson(Map<String,dynamic>json):

    cityname=json["city"],
    country=json["iso2"],
    lat=json["lat"].toDouble(),
    long=json["lng"].toDouble();


}