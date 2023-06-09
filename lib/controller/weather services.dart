import 'dart:convert';

import 'package:agri_app/model/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<Position> getposition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

Future<Weather> getweatherdata(var latitude, var longitude) async {
  var uri = Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=afa5323058974cbb9cf151657230504&q=$latitude,$longitude&aqi=no");
  var res = await http.get(uri);
  // var bod
  return Weather.fromjson(jsonDecode(res.body));
}
