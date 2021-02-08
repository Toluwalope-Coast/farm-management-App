import 'package:farm_manager/shared/analytics/income_analytic_body.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:flutter/material.dart';

class IncomeAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: IncomeAnalyticsBody(
        deviceSize: deviceSize,
      ),
    );
  }
}
