import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'package:KashWHawa/components/dailyTempretureTemplate.dart';
import 'package:KashWHawa/components/WeatherInfoCard.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import '../services/weather.dart';
import 'package:flutter/widgets.dart';
import 'package:KashWHawa/components/mainAppTitle.dart';
import 'package:intl/intl.dart';




class CurrentWeather extends StatefulWidget {
  
//  CurrentWeather({this.weatherData});
//  final dynamic weatherData;

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  WeatherModel weather = WeatherModel();

  int tempreture;
  var weatherDescription;
  var windSpeed;
  var humidity;
  var feelLike;
  var timeZone;
  String weatherIcon;
  String cityName;
  DateTime dateToday = DateTime.now();

  dynamic _weatherData;
  List <dynamic> dailyWeatherData;

  String getTodayDay() {
    return DateFormat('EEEE').format(dateToday);
  }

  Future<dynamic> getData( ) async{
     _weatherData = await WeatherModel().getCurrentLocationWeather();
     updateUI(_weatherData);

  }


  @override
  void initState(){
      getData();
    // TODO: implement initState
    super.initState();
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

      dailyWeatherData = weatherData['hourly'];
      tempreture = weatherData['current']['temp'].toInt();

      weatherDescription = weatherData['current']['weather'][0]['description'];

      windSpeed = weatherData['current']['wind_speed'];
      humidity = weatherData['current']['humidity'];
      timeZone = weatherData['timezone'];
      feelLike = weatherData['current']['feels_like'].toInt();
//      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];

    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex:1,
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(children: [
                      FlatButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.location_on,
                          color: kIconColor,
                          size: kIconSize,
                        ),
                      ),
                ],)
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        MainAppTitleName(),
                        SizedBox(height: 4),
                        Text(timeZone.toString())
                      ],
                    ),
                  ),
                  Expanded(
                    child:  Column(
                      children: [
                        FlatButton(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex:8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex:2,
                    child: Image.asset(
                  'assets/images/clear-day.png',
                      scale: 1,
                )),
                
                Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text(weatherDescription.toString())),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tempreture.toString(),
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
                ),
                Expanded(
                    flex: 1,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              WeatherInfoCard(
                                label: 'wind',
                                value: windSpeed,
                                symbol: 'mph',
                              ),

                              WeatherInfoCard(
                                label: 'Humidity',
                                value: humidity,
                                symbol: '%',
                              ),

                              WeatherInfoCard(
                                label: 'Feels Like',
                                value: feelLike,
                                symbol: '°C',
                              )
                            ],
                          ),
                        ),

                      ],
                    )),

                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${getTodayDay()}, Today',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                              for(var data in dailyWeatherData)   DailyTempretureTemplate(
                                time:  DateFormat().add_j().format(DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000)),
                                imageSource: 'assets/images/clean-night.png',
                                temperature: data['temp'].toInt(),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//DateFormat.jm().format(DateTime(data['dt'])).toString()


