import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:KashWHawa/components/unitRadioButton.dart';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

enum TempretureUnit { imperial, metric }

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TempretureUnit selectedUnit = TempretureUnit.metric;
  String defaultLanguage = 'English';
  List<String> languages = ['English', 'Arabic'];

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
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UnitRadioButton(
                      onSelect: () {
                        setState(() {
                          selectedUnit = TempretureUnit.metric;
                        });
                      },
                      label: 'Celsius ',
                      imageSource: selectedUnit == TempretureUnit.metric
                          ? 'images/celcuis.png'
                          : 'images/celcuis-default.png',
                      bgColor: selectedUnit == TempretureUnit.metric
                          ? kActiveItemColor
                          : Colors.white,

                      labelColor: selectedUnit == TempretureUnit.metric
                          ? Colors.white
                          : kPrimaryColor,
                    ),
                    UnitRadioButton(
                      onSelect: () {
                        setState(() {
                          selectedUnit = TempretureUnit.imperial;
                        });
                      },
                      label: 'Fahrenheit ',
                      imageSource: selectedUnit == TempretureUnit.imperial
                          ? 'images/fehreinigh.png'
                          : 'images/fehreinigh-inactive.png',
                      bgColor: selectedUnit == TempretureUnit.imperial
                          ? kActiveItemColor
                          : Colors.white,
                      labelColor: selectedUnit == TempretureUnit.imperial
                          ? Colors.white
                          : kPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          )),
          Expanded(
            flex:1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25,left: 20),
                          child: Text(
                            'Language',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: CustomRadioButton(
                            unSelectedColor: Theme.of(context).canvasColor,
                            enableShape: true,
                            customShape: ,
                            buttonTextStyle: ButtonTextStyle(unSelectedColor: kTextColor, textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            buttonLables: [
                              "English",
                              "Arabic",
                            ],

                            buttonValues: [
                              "English",
                              "Arabic",
                            ],
                            radioButtonValue: (values) {
                              print(values);
                            },
                            defaultSelected: "English",
                            horizontal: true,

                            // hight: 50,
                            selectedColor: kActiveItemColor,
                            padding: 15,

                            spacing: 0.0,
                            // enableShape: true,
                          ),
                        ),
                      ],

                    ),
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
