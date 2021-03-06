import 'package:KashWHawa/screens/current_weather.dart';
import 'package:KashWHawa/services/weather.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:KashWHawa/screens/settings.dart';
import 'package:KashWHawa/screens/forcasts.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.weatherData, this.cityName});

  final dynamic weatherData;
  final String cityName;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}



class _LocationScreenState extends State<LocationScreen> {

  int _pageIndex = 0;

  PageController _pageController;



  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void onPageChange(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tabPages = [
      CurrentWeather(weatherDataFromAPI: widget.weatherData, cityName: widget.cityName,),
      Forcasts(forcastsDataFromAPI: widget.weatherData['daily'],cityName: widget.cityName,),
      Settings(),
    ];

    return  ChangeNotifierProvider(
      create: (context) => WeatherModel(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: 
        BottomNavigationBar(
          currentIndex: _pageIndex,
              onTap: onTabTapped,
              backgroundColor: kbackgroundColor,
              selectedItemColor: kActiveItemColor,

            items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.wb_cloudy,
                size: kbottomBarIconSize,
              ),
              title: Text("Today's weather")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit,
                size: kbottomBarIconSize,
              ),
              title: Text('Forecasts')
          ) ,
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
        ]),
          body:Consumer<WeatherModel>(
                builder: (context, cart, child) {
                    return PageView(children: tabPages,
                      onPageChanged: onPageChange,
                      controller: _pageController,
                    );
                },
          )
      ),
    );
  }
}




