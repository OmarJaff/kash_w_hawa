import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:KashWHawa/components/unitRadioButton.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Settings',
              style: TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Show Tempreture in',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UnitRadioButton(
                      label: 'Celsius ',
                      imageSource: 'images/celcuis.png',
                      bgColor: Color(0xFFF8AD20),
                      shadow: BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                          blurRadius: 0),
                      labelColor: Colors.white,
                    ),
                    UnitRadioButton(
                      label: 'Fahrenheit ',
                      imageSource: 'images/fehreinigh-inactive.png',
                      bgColor: kbackgroundColor,
                      labelColor: kPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          )),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey.shade400,
                    child: Text('langauges'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
