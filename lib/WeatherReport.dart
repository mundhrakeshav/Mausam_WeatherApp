class WeatherReport {
  String location,
      id,
      country,
      description,
      longitude,
      latitude,
      pressure,
      humidity,
      temprature,
      feelLikeTemprature,
      minTemp,
      maxTemp,
      windSpeed,
      windDir;
  WeatherReport.fromJson(Map<String, dynamic> json) {
    longitude = json['coord']['lon'].toString();
    latitude = json['coord']['lat'].toString();
    country = json['sys']['country'].toString();
    id = json['weather'][0]['id'].toString();
    location = json['name'].toString();
    description = json['weather'][0]['description'].toString();
    temprature = json['main']['temp'].toString();
    feelLikeTemprature = json['main']['feels_like'].toString();
    minTemp = json['main']['temp_min'].toString();
    maxTemp = json['main']['temp_max'].toString();
    pressure = json['main']['pressure'].toString();
    humidity = json['main']['humidity'].toString();
    windSpeed = json['wind']['speed'].toString();
    windDir = json['wind']['deg'].toString();
  }
}
