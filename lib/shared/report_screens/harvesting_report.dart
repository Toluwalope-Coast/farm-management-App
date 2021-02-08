import 'package:farm_manager/models/harvesting_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/harvesting_report_body.dart';
import 'package:flutter/material.dart';

class HarvestingReport extends StatelessWidget {
  final List<Harvesting> harvest;

  const HarvestingReport({Key key, this.harvest}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: HarvestingReportBody(deviceSize: deviceSize, harvesting: harvest),
    );
  }
}
