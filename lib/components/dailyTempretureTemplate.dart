import 'package:flutter/material.dart';

class DailyTempretureTemplate extends StatelessWidget {
  DailyTempretureTemplate({this.time, this.imageSource, this.temperature, this.scale = 3.9});
  final String time;
  final String imageSource;
  final int temperature;
  final double scale;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20, bottom: 20, left: 8),
      child: Container(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time),
            Image.asset(
              imageSource,
              scale:scale,
            ),
            Text('${temperature.toString()} °C')
          ],
        ),
      ),
    );
  }
}