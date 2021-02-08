import 'package:farm_manager/models/machineries_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/machines_report_body.dart';
import 'package:flutter/material.dart';

class MachinesReport extends StatelessWidget {
  final List<Machinery> machines;

  const MachinesReport({Key key, this.machines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: MachinesReportBody(deviceSize: deviceSize, machines: machines),
    );
  }
}
