import 'package:farm_manager/models/chemicals_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/chemicals_report_body.dart';
import 'package:flutter/material.dart';

class ChemicalsReport extends StatelessWidget {
  final List<Chemical> chemical;

  const ChemicalsReport({Key key, this.chemical}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: ChemicalsReportBody(deviceSize: deviceSize, chemical: chemical),
    );
  }
}
