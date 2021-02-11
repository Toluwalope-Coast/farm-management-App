import 'package:farm_manager/models/incomes_models.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/incomes_report_body.dart';
import 'package:flutter/material.dart';

class IncomesReport extends StatelessWidget {
  final List<Income> incomes;

  const IncomesReport({Key key, this.incomes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: IncomesReportBody(deviceSize: deviceSize, incomes: incomes),
    );
  }
}
