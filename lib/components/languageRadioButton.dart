import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';

class LanguageRadioButton extends StatelessWidget {

  LanguageRadioButton({this.onSelect, this.radioButton, this.labelColor, this.label});

  final Function onSelect;
  final Radio radioButton;
  final Color labelColor;

  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            boxShadow: [ BoxShadow(
                color: kPrimaryColor.withOpacity(0.2),
                spreadRadius: 0.4,
                blurRadius: 1,
                offset: Offset(-2, 4))],
            color: Colors.white,
          ),
          margin: EdgeInsets.only(
              left: 30, right: 30, top: 50, bottom: 50),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: radioButton
                ),
                SizedBox(height: 10),
                Text(
                  label,
                  style: TextStyle(
                      color: labelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
