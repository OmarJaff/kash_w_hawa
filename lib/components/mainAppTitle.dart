import 'package:flutter/material.dart';
import 'package:KashWHawa/utilities/constants.dart';

class MainAppTitleName extends StatelessWidget {
  const MainAppTitleName({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Kash w Hawa',
      style: TextStyle(
          color: kTextColor, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
