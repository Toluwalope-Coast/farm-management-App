import 'package:farm_manager/models/expenses_models.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/expenses_report_body.dart';
import 'package:flutter/material.dart';

class ExpensesReport extends StatelessWidget {
  final List<Expenses> expenses;

  const ExpensesReport({Key key, this.expenses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: ExpensesReportBody(deviceSize: deviceSize, expenses: expenses),
    );
  }
}
