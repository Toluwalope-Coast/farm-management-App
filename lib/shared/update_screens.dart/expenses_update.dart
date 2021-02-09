import 'package:farm_manager/models/expenses_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/expenses_update_body.dart';
import 'package:flutter/material.dart';

class ExpensesUpdate extends StatelessWidget {
  final Size deviceSize;
  final Expenses expenses;

  const ExpensesUpdate({Key key, this.deviceSize, this.expenses})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: ExpensesUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Expenses',
        heroTag: "assets/images/expenditures.jpg",
        expenses: expenses,
      ),
    );
  }
}
