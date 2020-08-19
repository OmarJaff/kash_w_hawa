import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
          scaffoldBackgroundColor:Color(0xFFE5F0FC)
      ),
      home: LoadingScreen(),
    );
  }
}
