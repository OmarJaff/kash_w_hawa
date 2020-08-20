import 'package:flutter/material.dart';

class WeeklyTempretureTemplate extends StatelessWidget {
  WeeklyTempretureTemplate({this.date,this.day,this.status,this.tempreture, this.imageSource});
  final String date;
  final String day;
  final String imageSource;
  final String status;
  final String tempreture;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date.toString(),
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              day,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
        
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imageSource,
              scale: 2.5,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                status,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 4,),
              Text(
                tempreture,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}