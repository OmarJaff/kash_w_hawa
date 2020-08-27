import './utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:KashWHawa/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
          scaffoldBackgroundColor:Color(0xFFE5F0FC),
          unselectedWidgetColor:kPrimaryColor
      ),
      home: LoadingScreen(),
    );

  }
}
