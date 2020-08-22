import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:KashWHawa/utilities/constants.dart';

class DeveloperInfoText extends StatelessWidget {
  const DeveloperInfoText({
    Key key,
    @required TapGestureRecognizer tapGestureRecognizer,
  }) : _tapGestureRecognizer = tapGestureRecognizer, super(key: key);

  final TapGestureRecognizer _tapGestureRecognizer;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: kPrimaryColor),
              children: <TextSpan>[
                TextSpan(text: 'Developed by '),
                TextSpan(
                  text: 'Omar S. Jaff',
                  style: TextStyle(color: Colors.blue.shade400),
                  recognizer: _tapGestureRecognizer,
                ),
              ]),
        ));
  }
}