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
              Text('Show Tempreture in'),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UnitRadioButton(label: 'Celsius ',imageSource: 'images/celcuis.png'),
                  UnitRadioButton(label: 'Fahrenheit ',imageSource: 'images/fehreinigh.png')
                ],
              ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey.shade400,
                    child:Text('langauges') ,
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


