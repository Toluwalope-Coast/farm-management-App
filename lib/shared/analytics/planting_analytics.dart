import 'package:farm_manager/shared/analytics/planting_analytic_body.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:flutter/material.dart';

class PlantingAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: PlantingAnalyticsBody(
        deviceSize: deviceSize,
      ),
    );
  }
}
