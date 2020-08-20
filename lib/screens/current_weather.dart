import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'package:KashWHawa/components/dailyTempretureTemplate.dart';
import 'package:KashWHawa/components/WeatherInfoCard.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import '../services/weather.dart';
import 'package:flutter/widgets.dart';

class CurrentWeather extends StatefulWidget {
  CurrentWeather({this.weatherData});
  final dynamic weatherData;
  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
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
  Widget build(BuildContext context) {
    return  Container(
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
                          MaterialPageRoute(
                              builder: (context) => CityScreen()),
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
                    margin: EdgeInsets.all(10),
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
                  height: 5,
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
                  margin: EdgeInsets.all(15),
                  height: 80,
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

                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}



