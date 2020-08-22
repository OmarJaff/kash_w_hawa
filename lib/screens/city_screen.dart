import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:lottie/lottie.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  AnimationController _controller;
  String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(

        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            onSubmitted: (val) {
                              print(val);
                            },
                            autofocus: true,
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
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Lottie.asset('assets/animations/location_search_animation.json',
                    )
                  ],
                ),
              ),
//              FlatButton(
//                onPressed: () {
//                  Navigator.pop(context,cityName);
//                },
//                child: Text(
//                  'Get Weather',
//                  style: kButtonTextStyle,
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
