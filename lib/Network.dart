import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'WeatherReport.dart';
import 'Keys.dart';

class NetworkData {
  double _latitude;
  double _longitude;
  Future<WeatherReport> getWeather() async {
    http.Response resp = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey');
    if (resp.statusCode == 200) {
      var weatherData = json.decode(resp.body);
      WeatherReport weatherReport = WeatherReport.fromJson(weatherData);
      return weatherReport;
    } else {
      print(resp.statusCode);
      return null;
    }
  }

  Future<WeatherReport> getLoc() async {
    Position pos = await Geolocator().getCurrentPosition();
    print(pos.latitude);
    print(pos.longitude);
    _latitude = pos.latitude;
    _longitude = pos.longitude;
    WeatherReport report = await getWeather();
    return report;
  }
}
