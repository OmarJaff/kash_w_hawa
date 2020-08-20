import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputDecorations = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Type city Name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide.none));

const Color kPrimaryColor = Color(0xFF9BA3B9);
const double kIconSize = 30;
const Color  kbackgroundColor = Color(0xFFE5F0FC);
const double kbottomBarIconSize = 22;
const Color kTextColor = Color(0xFF181D30);
const Color kIconColor = Color(0xFF5E6369);
const double  kWidthBetweenCards = 8;
const Color kActiveItemColor = Color(0xFFFFA500);
