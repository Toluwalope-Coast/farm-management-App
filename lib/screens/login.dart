import 'package:farm_manager/shared/background.dart';
import 'package:farm_manager/shared/login_body.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background(
      deviceSize: deviceSize,
      body: LoginBody(deviceSize: deviceSize),
    );
  }
}
