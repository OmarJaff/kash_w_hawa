import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';

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

              child: Row(
            children: [
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/celcuis.png', scale: 1,),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 20),
                          child: Text('celsius ', style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red.shade800
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/fehreinigh.png', scale: 1,),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 20),
                          child: Text('celsius ', style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
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
