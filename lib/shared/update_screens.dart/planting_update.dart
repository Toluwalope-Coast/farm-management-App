import 'package:farm_manager/models/planting_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/planting_update_body.dart';
import 'package:flutter/material.dart';

class PlantingUpdate extends StatelessWidget {
  final Size deviceSize;
  final Planting planting;

  const PlantingUpdate({Key key, this.deviceSize, this.planting})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: PlantingUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Planting',
        heroTag: "assets/images/Planting.jpg",
        planting: planting,
      ),
    );
  }
}
