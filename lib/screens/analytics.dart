import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytic_body.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:flutter/material.dart';

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: AnalyticsBody(
        deviceSize: deviceSize,
        ctaLists: ctaAnalyticsLists(context),
      ),
    );
  }
}
