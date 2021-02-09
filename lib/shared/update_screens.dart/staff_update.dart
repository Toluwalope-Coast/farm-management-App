import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/staff_update_body.dart';
import 'package:flutter/material.dart';

class StaffUpdate extends StatelessWidget {
  final Size deviceSize;
  final Staff staff;

  const StaffUpdate({Key key, this.deviceSize, this.staff}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: StaffUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Staff',
        heroTag: "assets/images/staffs.jpg",
        staff: staff,
      ),
    );
  }
}
