// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:get/get.dart';

class Weather {
  var cityname = "";
  var icon = "";
  var temp = 0.0;
  var humidity = 0;
  var windspeed = 0.0;
  var condition = "";
  Weather({
    required this.cityname,
    required this.icon,
    required this.temp,
    required this.humidity,
    required this.windspeed,
    required this.condition,
  });

  Weather.fromjson(Map<String, dynamic> json) {
    cityname = json['location']['name'];
    icon = json['current']['condition']['icon'];
    temp = json['current']['temp_c'];
    windspeed = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    condition = json['current']['condition']['text'];
  }
}
