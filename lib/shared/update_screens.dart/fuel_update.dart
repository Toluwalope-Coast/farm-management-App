import 'package:farm_manager/models/fuels_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/fuel_update_body.dart';
import 'package:flutter/material.dart';

class FuelUpdate extends StatelessWidget {
  final Size deviceSize;
  final Fuel fuel;

  const FuelUpdate({Key key, this.deviceSize, this.fuel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: FuelUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Fuel',
        heroTag: "assets/images/fuel.jpg",
        fuel: fuel,
      ),
    );
  }
}
