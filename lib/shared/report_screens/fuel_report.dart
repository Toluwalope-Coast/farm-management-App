import 'package:farm_manager/models/fuels_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/fuel_report_body.dart';
import 'package:flutter/material.dart';

class FuelReport extends StatelessWidget {
  final List<Fuel> fuel;

  const FuelReport({Key key, this.fuel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: FuelReportBody(deviceSize: deviceSize, fuel: fuel),
    );
  }
}
