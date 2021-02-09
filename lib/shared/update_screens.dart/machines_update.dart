import 'package:farm_manager/models/machineries_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/machines_update_body.dart';
import 'package:flutter/material.dart';

class MachinesUpdate extends StatelessWidget {
  final Size deviceSize;
  final Machinery machinery;

  const MachinesUpdate({Key key, this.deviceSize, this.machinery})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: MachinesUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Machines',
        heroTag: "assets/images/machines2.jpg",
        machinery: machinery,
      ),
    );
  }
}
