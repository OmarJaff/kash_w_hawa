
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:KashWHawa/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

    void getLocation()  async {
      var weatherData = await WeatherModel().getCurrentLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData:  weatherData);
      }));
    }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Color(0xFFF8AB1C),
          size: 100,
        ),
      ),
    );
  }
}

