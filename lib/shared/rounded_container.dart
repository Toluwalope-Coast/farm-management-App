import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  final Size deviceSize;
  final Color containerColor;
  final Widget content;
  CustomRoundedContainer(
      {Key key,
      @required this.deviceSize,
      @required this.containerColor,
      @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      width: deviceSize.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(29)),
      child: content,
    );
  }
}
