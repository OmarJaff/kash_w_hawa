import 'package:flutter/material.dart';

class DailyTempretureTemplate extends StatelessWidget {
  DailyTempretureTemplate({this.time, this.imageSource, this.temperature});
  final String time;
  final String imageSource;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20, bottom: 20, left: 8),
      child: Container(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(time),
            Image.asset(
              imageSource,
              scale: 3.9,
            ),
            Text('${temperature.toString()} °C')
          ],
        ),
      ),
    );
  }
}