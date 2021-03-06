import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class WeatherInfoCard extends StatelessWidget {
  WeatherInfoCard({@required this.label, @required this.value, this.symbol});
  final String label;
  final dynamic value;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10 ,bottom: 10, right: 12,left: 0),
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          boxShadow: [
            BoxShadow(
                color: kPrimaryColor.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(-2, 4))
          ],
          color: Colors.white),
      padding: EdgeInsets.only(top: 25, left: 12, right: 12, bottom: 0),

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