import 'package:farm_manager/shared/analytics/seeds_analytic_body.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:flutter/material.dart';

class SeedsAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: SeedsAnalyticsBody(
        deviceSize: deviceSize,
      ),
    );
  }
}
