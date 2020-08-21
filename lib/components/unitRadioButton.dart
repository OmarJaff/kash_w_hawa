import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';

class UnitRadioButton extends StatelessWidget {
  UnitRadioButton({this.bgColor = kbackgroundColor, this.shadow = const BoxShadow(color: kPrimaryColor, offset: Offset(0,0),spreadRadius:0 ,blurRadius: 0) ,this.imageSource, this.label});
  final Color bgColor;
  final BoxShadow shadow;
  final String imageSource;
  final String label;
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
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageSource, scale: 1.5,),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 20),
              child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}