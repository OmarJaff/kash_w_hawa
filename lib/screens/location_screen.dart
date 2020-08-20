import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/widgets.dart';
import 'city_screen.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      tempreture = 0;
      weatherIcon = 'Error!';
      weatherDescription = 'Unable to get weather data';
      cityName = '';
      return;
    }
    setState(() {
      tempreture = weatherData['main']['temp'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherDescription = weather.getMessage(tempreture.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.location_on,
                          color: kIconColor,
                          size: kIconSize,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Kash w Hawa',
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(height: 4),
                          Text('Erbil, Iraq')
                        ],
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CityScreen()),
                          );
                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                        child: Icon(
                          Icons.search,
                          size: kIconSize,
                          color: kIconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'images/clear-day.png',
                    scale: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Clean day'),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(color: kTextColor, fontSize: 80),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          '°C',
                          style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 80,
                      margin: EdgeInsets.all(20),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          WeatherInfoCard(
                            label: 'wind',
                            value: 7,
                            symbol: 'mph',
                          ),
                          SizedBox(
                            width: kWidthBetweenCards,
                          ),
                          WeatherInfoCard(
                            label: 'Humidity',
                            value: 55,
                            symbol: '%',
                          ),
                          SizedBox(
                            width: kWidthBetweenCards,
                          ),
                          WeatherInfoCard(
                            label: 'Rain',
                            value: 10,
                            symbol: '%',
                          ),
                          SizedBox(
                            width: kWidthBetweenCards,
                          ),
                          WeatherInfoCard(
                            label: 'Feels Like',
                            value: 5,
                            symbol: '°C',
                          )
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Wednesday, Today',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 100,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        DailyTempretureTemplate(
                          time: '8pm',
                          imageSource: 'images/clear-day.png',
                          temperature: 28,
                        ),
                        DailyTempretureTemplate(
                          time: '9pm',
                          imageSource: 'images/broken-clouds.png',
                          temperature: 27,
                        ),
                        DailyTempretureTemplate(
                          time: '10pm',
                          imageSource: 'images/scattered-clouds.png',
                          temperature: 29,
                        ),
                        DailyTempretureTemplate(
                          time: '8pm',
                          imageSource: 'images/clean-night.png',
                          temperature: 25,
                        ),
                        DailyTempretureTemplate(
                          time: '11pm',
                          imageSource: 'images/shower.png',
                          temperature: 18,
                        ),
                        DailyTempretureTemplate(
                          time: '12am',
                          imageSource: 'images/thunder.png',
                          temperature: 12,
                        ),
                        DailyTempretureTemplate(
                          time: '1am',
                          imageSource: 'images/snowy.png',
                          temperature: -3,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyTempretureTemplate extends StatelessWidget {
  DailyTempretureTemplate({this.time, this.imageSource, this.temperature});
  final String time;
  final String imageSource;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(time),
          Image.asset(
            imageSource,
            scale: 4.5,
          ),
          Text('${temperature.toString()} °C')
        ],
      ),
    );
  }
}

class WeatherInfoCard extends StatelessWidget {
  WeatherInfoCard({@required this.label, @required this.value, this.symbol});
  final String label;
  final double value;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          boxShadow: [
            BoxShadow(
                color: kIconColor.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3))
          ],
          color: Colors.white),
      padding: EdgeInsets.only(top: 25, left: 12, right: 30, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.label),
          SizedBox(
            height: 4,
          ),
          Text(
            '$value $symbol',
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          )
        ],
      ),
    );
  }
}
