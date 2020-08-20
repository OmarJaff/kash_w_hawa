import 'package:KashWHawa/screens/current_weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:KashWHawa/services/weather.dart';
import 'package:flutter/widgets.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final dynamic weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var tempreture;
  String weatherDescription;
  String weatherIcon;
  String cityName;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:  CurrentWeather(),
      bottomNavigationBar: 
      BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: kActiveItemColor,

          items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_cloudy,
              size: kbottomBarIconSize,
            ),
            title: Text("Current weather")),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
              size: kbottomBarIconSize,
            ),
            title: Text('Forecasts')
        ) ,
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
      ]),
    );
  }
}




