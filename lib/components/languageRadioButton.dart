import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';

class LanguageRadioButton extends StatelessWidget {

  LanguageRadioButton({this.onSelect, this.radioButton, this.labelColor,this.bgColor, this.label});

  final Function onSelect;
  final Radio radioButton;
  final Color labelColor;
  final Color bgColor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            boxShadow: [BoxShadow(color: kPrimaryColor, offset: Offset(0,1),spreadRadius:0.2 ,blurRadius: 0)],
            color: bgColor,
          ),
          margin: EdgeInsets.only(
              left: 30, right: 30, top: 50, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 2,
                child: radioButton
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0),
                child: Text(
                  label,
                  style: TextStyle(
                      color: kActiveItemColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
