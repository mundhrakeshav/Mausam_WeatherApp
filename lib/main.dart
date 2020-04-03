import 'package:clima/Network.dart';
import 'package:clima/WeatherReport.dart';
import 'package:flutter/material.dart';
import 'Theme&Constants.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[900]),
      title: 'clima',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double latData;
  bool showData = false;
  double longData;
  WeatherReport weatherData;

  NetworkData dataLocWeather;
  getLocWeather() async {
    dataLocWeather = NetworkData();
    weatherData = await dataLocWeather.getLoc();

    setState(() {
      showData = true;
    });
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  @override
  void initState() {
    super.initState();
    getLocWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (showData == false)
      return fad4;
    else
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: Text(
            "MAUSAM",
            style:
                TextStyle(color: Colors.grey[100], fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: ReusableCard(
                      cardChild: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "You are at:",
                              style: coordiTextStyle,
                            ),
                            Text(
                              '${weatherData.latitude}, ${weatherData.longitude}',
                              style: coordiTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${weatherData.location},${weatherData.country}',
                              style: locTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ReusableCard(
                      cardChild: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Its:",
                              style: coordiTextStyle,
                            ),
                            Text(
                              '${weatherData.temprature}',
                              style: coordiTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Feels like:\n ${weatherData.feelLikeTemprature}',
                              style: locTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Center(
                        child: Text(
                          getWeatherIcon(int.parse(weatherData.id)),
                          style: wIcon,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class ReusableCard extends StatelessWidget {
  Widget cardChild;

  ReusableCard({this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(7),
      decoration: cardDecoration,
      child: cardChild,
    );
  }
}
