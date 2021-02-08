import 'package:farm_manager/models/planting_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/planting_report_body.dart';
import 'package:flutter/material.dart';

class PlantingReport extends StatelessWidget {
  final List<Planting> planting;

  const PlantingReport({Key key, this.planting}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: PlantingReportBody(deviceSize: deviceSize, planting: planting),
    );
  }
}
