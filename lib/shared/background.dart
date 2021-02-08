import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget body;
  final Size deviceSize;

  Background({Key key, @required this.body, @required this.deviceSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: deviceSize.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: deviceSize.width * 0.35,
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    width: deviceSize.width * 0.4,
                  )),
              body,
            ],
          )),
    );
  }
}
