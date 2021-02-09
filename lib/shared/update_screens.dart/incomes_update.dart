import 'package:farm_manager/models/incomes_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/incomes_update_body.dart';
import 'package:flutter/material.dart';

class IncomesUpdate extends StatelessWidget {
  final Size deviceSize;
  final Income income;

  const IncomesUpdate({Key key, this.deviceSize, this.income})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: IncomesUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Incomes',
        heroTag: "assets/images/incomes.jpg",
        income: income,
      ),
    );
  }
}
