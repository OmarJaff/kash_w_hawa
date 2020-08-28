import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'city_screen.dart';
import 'package:KashWHawa/components/dailyTempretureTemplate.dart';
import 'package:KashWHawa/components/WeatherInfoCard.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import '../services/weather.dart';
import 'package:flutter/widgets.dart';
import 'package:KashWHawa/components/mainAppTitle.dart';
import 'package:intl/intl.dart';
import 'package:KashWHawa/screens/loading_screen.dart';

class CurrentWeather extends StatefulWidget {
  CurrentWeather({this.weatherDataFromAPI});

  final dynamic weatherDataFromAPI;

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  int tempreture;
  var weatherDescription;
  var windSpeed;
  var humidity;
  var feelLike;
  String weatherConditionImageSource;
  String weatherIcon;
  String cityName;
  DateTime dateToday = DateTime.now();

  List<dynamic> hourlyWeatherData;

  String getTodayDay() {
    return DateFormat('EEEE').format(dateToday);
  }

  Future<dynamic> getData() async {
    updateUI(widget.weatherDataFromAPI);
  }

  bool isSearchedByCityName = false;

  @override
  void initState() {
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

    if (isSearchedByCityName == true) {
      setState(() {
        if (weatherData['cod'] == '404' ) {
            showDialog(context: context,
            builder: (BuildContext context)
            {
              return  AlertDialog(
                title: Text('Unknown city name'),
                content: Text('Please Enter a valid City Name'),
                actions: [
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('Close'))
                ],
              );
            }
            );

          return;
        }
        tempreture = weatherData['main']['temp'].toInt();
        weatherDescription = weatherData['weather'][0]['description'];
        windSpeed = weatherData['wind']['wind_speed'];
        humidity = weatherData['main']['humidity'];
        feelLike = weatherData['main']['feels_like'].toInt();
        cityName = weatherData['name'];
        weatherConditionImageSource = weatherData['weather'][0]['icon'];
      });
      return;
    }

    setState(() {
      hourlyWeatherData = weatherData['hourly'];
      tempreture = weatherData['current']['temp'].toInt();
      weatherDescription = weatherData['current']['weather'][0]['description'];
      windSpeed = weatherData['current']['wind_speed'];
      humidity = weatherData['current']['humidity'];
      cityName = weatherData['timezone'];
      feelLike = weatherData['current']['feels_like'].toInt();
      weatherConditionImageSource =
          weatherData['current']['weather'][0]['icon'];
    });
  }

  Widget build(BuildContext context) {
    var weather = WeatherModel();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              isSearchedByCityName = false;
                              return LoadingScreen();
                            }));
                          });
                        },
                        child: Icon(
                          Icons.location_on,
                          color: kIconColor,
                          size: kIconSize,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        MainAppTitleName(),
                        SizedBox(height: 4),
                        Text(cityName.toString())
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityScreen()),
                            );
                            if (typedName != null) {
                              var weatherData =
                                  await weather.getCityWeather(typedName);
                              isSearchedByCityName = true;
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

          Consumer<WeatherModel>(
            builder: (context, model , child) =>
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        weather.getWeatherImage(weatherConditionImageSource),
                        scale: 1,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
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
                if(!isSearchedByCityName)  Expanded(
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
                              for (var data in hourlyWeatherData)
                                DailyTempretureTemplate(
                                  time: DateFormat().add_j().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          data['dt'] * 1000)),
                                  imageSource: weather.getWeatherImage(
                                      data['weather'][0]['icon']),
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
          ),
        ],
      ),
    );
  }
}

//DateFormat.jm().format(DateTime(data['dt'])).toString()
