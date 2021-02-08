import 'package:farm_manager/models/tillage_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/tillage_report_body.dart';
import 'package:flutter/material.dart';

class TillageReport extends StatelessWidget {
  final List<Tillage> tillage;

  const TillageReport({Key key, this.tillage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: TillageReportBody(deviceSize: deviceSize, tillage: tillage),
    );
  }
}
