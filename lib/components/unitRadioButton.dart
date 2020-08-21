import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/painting.dart';

class UnitRadioButton extends StatelessWidget {
  UnitRadioButton({this.bgColor = kCustomRadioColor,
    this.shadow = const BoxShadow(color: kPrimaryColor, offset: Offset(0,1),spreadRadius:0.5 ,blurRadius: 0) ,
    this.imageSource, this.label, this.labelColor});
  final Color bgColor;
  final BoxShadow shadow;
  final String imageSource;
  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: [shadow],
          color: bgColor,
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageSource, scale: 1.3,),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 20),
              child: Text(label, style: TextStyle(color: labelColor, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}