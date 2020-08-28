import 'package:flutter/cupertino.dart';
import 'package:KashWHawa/components/customizedRadioButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:KashWHawa/services/weather.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:KashWHawa/components/developerNameString.dart';
import 'package:KashWHawa/screens/loading_screen.dart';

enum TempretureUnits { imperial, metric }
enum Languages { english, arabic }

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var weather = WeatherModel();

  TempretureUnits selectedUnit = TempretureUnits.metric;
  Languages selectedLanguage = Languages.english;

  TapGestureRecognizer _tapGestureRecognizer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = () => launch('https://www.omarjaff.com');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Settings',
              style: TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            flex: 1,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 15),
                child: Text(
                  'Show Tempreture in',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    CustomizedRadioButton(
                      radioButton: Radio(
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        activeColor: kActiveItemColor,
                        value: TempretureUnits.metric,
                        groupValue: selectedUnit,
                        onChanged: (v) {
                          setState(() {
                            selectedUnit = TempretureUnits.metric;

                          });
                        },
                      ),
                      onSelect: () {
                        setState(() {
                          selectedUnit = TempretureUnits.metric;
                        });
                      },
                      labelColor: selectedUnit == TempretureUnits.metric
                          ? kActiveItemColor
                          : kPrimaryColor,
                      label: 'Celsius',
                    ),
                    CustomizedRadioButton(
                      radioButton: Radio(
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        activeColor: kActiveItemColor,
                        value: TempretureUnits.imperial,
                        groupValue: selectedUnit,
                        onChanged: (v) {
                          setState(() {
                            selectedUnit = TempretureUnits.imperial;
                            weather.changeUnit('Fahrenheit');
                          });
                        },
                      ),
                      onSelect: () {
                        setState(() {
                          selectedUnit = TempretureUnits.imperial;
                          weather.changeUnit('Fahrenheit');
                        });
                      },
                      labelColor: selectedUnit == TempretureUnits.imperial
                          ? kActiveItemColor
                          : kPrimaryColor,
                      label: 'Fahrenheit',
                    ),
                  ],
                ),
              ),
            ],
          )),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 28),
                        child: Text(
                          'Language',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          CustomizedRadioButton(
                            radioButton: Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: kActiveItemColor,
                              value: Languages.english,
                              groupValue: selectedLanguage,
                              onChanged: (v) {
                                setState(() {
                                  selectedLanguage = Languages.english;
                                });
                              },
                            ),
                            onSelect: () {
                              setState(() {
                                selectedLanguage = Languages.english;
                              });
                            },
                            labelColor: selectedLanguage == Languages.english
                                ? kActiveItemColor
                                : kPrimaryColor,
                            label: 'English',
                          ),
                          CustomizedRadioButton(
                            radioButton: Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: kActiveItemColor,
                              value: Languages.arabic,
                              groupValue: selectedLanguage,
                              onChanged: (v) {
                                setState(() {
                                  selectedLanguage = Languages.arabic;
                                });
                              },
                            ),
                            onSelect: () {
                              setState(() {
                                selectedLanguage = Languages.arabic;
                              });
                            },
                            labelColor: selectedLanguage == Languages.arabic
                                ? kActiveItemColor
                                : kPrimaryColor,
                            label: 'Arabic',
                          )
                        ],
                      ),
                      Expanded(
                        child: DeveloperInfoText(tapGestureRecognizer: _tapGestureRecognizer),
                      )
                    ],
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


