import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:

                          Icon(
                              Icons.arrow_back,
                              size: kIconSize,
                              color: kIconColor,

                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                        child: Container(
                            margin: EdgeInsets.only(right: 20),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.black
                            ),
                            decoration: kInputDecorations,
                            onChanged: (value) {
                              cityName = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
