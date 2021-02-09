import 'package:farm_manager/shared/rounded_container.dart';
import 'package:flutter/material.dart';

class RoundedFlatButton extends StatelessWidget {
  final Size deviceSize;
  final Color buttonBackgroundColor;
  final String buttonTextValue;
  final TextStyle buttonTextStyle;
  final Function buttonFunction;
  RoundedFlatButton(
      {Key key,
      @required this.deviceSize,
      @required this.buttonBackgroundColor,
      @required this.buttonTextValue,
      this.buttonTextStyle,
      @required this.buttonFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      deviceSize: deviceSize,
      containerColor: buttonBackgroundColor,
      content: TextButton(
          onPressed: buttonFunction,
          child: Text(
            buttonTextValue,
            style: buttonTextStyle,
          )),
    );
  }
}
