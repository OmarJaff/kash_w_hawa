import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/components/weeklyTempretureTemplate.dart';
import 'package:KashWHawa/components/mainAppTitle.dart';
import 'package:intl/intl.dart';
import 'package:KashWHawa/services/weather.dart';

class Forcasts extends StatefulWidget {

  Forcasts({this.forcastsDataFromAPI, this.timeZone});

  dynamic forcastsDataFromAPI;
  dynamic timeZone;

  @override
  _ForcastsState createState() => _ForcastsState();
}

class _ForcastsState extends State<Forcasts> {
  var weather = WeatherModel();
  @override
  void initState() {
    dailyWeatherData = widget.forcastsDataFromAPI;
    super.initState();
  }

  List<dynamic> dailyWeatherData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                 MainAppTitleName(),
                SizedBox(height: 4),
                Text(widget.timeZone.toString())
              ],
            ),
          )),
          Expanded(
            flex: 6,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10,
              primary: false,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                for(var data in dailyWeatherData)
                  WeeklyTempretureTemplate(
                    date: DateFormat().add_MMMd().format(DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000)),
                    day: DateFormat().add_EEEE().format(DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000)),
                    status: data['weather'][0]['description'],
                    imageSource: weather.getWeatherImage(data['weather'][0]['icon']),
                    tempreture: data['temp']['day'].toInt()                  ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
