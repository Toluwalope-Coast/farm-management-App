import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/garage_attendant_home_body.dart';
import 'package:flutter/material.dart';
import 'package:farm_manager/shared/background_2.dart';

class GarageAttendantHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: GarageAttendantHomeBody(
        deviceSize: deviceSize,
        ctaLists: garageAttendantCtaLists(context),
      ),
    );
  }
}
