import 'package:farm_manager/models/seeds_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/seeds_report_body.dart';
import 'package:flutter/material.dart';

class SeedsReport extends StatelessWidget {
  final List<Seed> seed;

  const SeedsReport({Key key, this.seed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: SeedsReportBody(deviceSize: deviceSize, seeds: seed),
    );
  }
}
