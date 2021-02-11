import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/farm_operator_home_body.dart';
import 'package:flutter/material.dart';
import 'package:farm_manager/shared/background_2.dart';

class FarmOperatorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: FarmOperatorHomeBody(
        deviceSize: deviceSize,
        ctaLists: farmOperatorCtaLists(context),
      ),
    );
  }
}
