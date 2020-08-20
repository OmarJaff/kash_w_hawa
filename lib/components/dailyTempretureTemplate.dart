import 'package:flutter/material.dart';

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