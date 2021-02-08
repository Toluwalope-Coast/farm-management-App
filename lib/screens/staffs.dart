import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/staffs_body.dart';
import 'package:flutter/material.dart';

class Staffs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: StaffsBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Staff',
        heroTag: "assets/images/staffs.jpg",
        dataLists: dataLists(),
      ),
    );
  }
}
