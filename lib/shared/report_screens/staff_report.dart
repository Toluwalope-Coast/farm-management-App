import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/staff_report_body.dart';
import 'package:flutter/material.dart';

class StaffReport extends StatelessWidget {
  final List<Staff> staff;

  const StaffReport({Key key, this.staff}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: StaffReportBody(deviceSize: deviceSize, staff: staff),
    );
  }
}
