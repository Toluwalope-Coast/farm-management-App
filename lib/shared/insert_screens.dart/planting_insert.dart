import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/insert_screens.dart/planting_insert_body.dart';
import 'package:flutter/material.dart';

class PlantingInsert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: PlantingInsertBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Planting',
        heroTag: "assets/images/Planting.jpg",
      ),
    );
  }
}
