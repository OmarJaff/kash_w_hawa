import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/components/weeklyTempretureTemplate.dart';

class Forcasts extends StatefulWidget {
  @override
  _ForcastsState createState() => _ForcastsState();
}

class _ForcastsState extends State<Forcasts> {
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
                Text(
                  'This Week',
                  style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: 4),
                Text('Erbil, Iraq')
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
                WeeklyTempretureTemplate(
                    date: 'Aug 22',
                    day: 'Saturday',
                    status: 'Clean',
                    imageSource: 'images/clear-day.png',
                    tempreture: '29'),
                WeeklyTempretureTemplate(
                    date: 'Aug 23',
                    day: 'Sunday',
                    status: 'Clean',
                    imageSource: 'images/clear-day.png',
                    tempreture: '28'),
                WeeklyTempretureTemplate(
                    date: 'Aug 24',
                    day: 'Monday',
                    status: 'Cloudy',
                    imageSource: 'images/few-clouds.png',
                    tempreture: '25'),
                WeeklyTempretureTemplate(
                    date: 'Aug 25',
                    day: 'Thursday',
                    status: 'Clean',
                    imageSource: 'images/clear-day.png',
                    tempreture: '22'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
