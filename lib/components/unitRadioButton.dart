import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';
import 'package:flutter/painting.dart';

class UnitRadioButton extends StatelessWidget {
  UnitRadioButton({this.bgColor = kCustomRadioColor,
    this.imageSource, this.label, this.labelColor, this.onSelect, this.shadow = const BoxShadow(color: kPrimaryColor, offset: Offset(0,1),spreadRadius:0.2 ,blurRadius: 0)
  });
  final Color bgColor;
   final String imageSource;
  final String label;
  final Color labelColor;
  final Function onSelect;
  final BoxShadow shadow;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            boxShadow: [shadow],
            color: bgColor,
          ),
          margin: EdgeInsets.only(left: 30,right: 30, top: 50,bottom: 50),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageSource, scale: 2,),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 20),
                child: Text(label, style: TextStyle(color: labelColor, fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}