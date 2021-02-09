import 'package:farm_manager/models/tillage_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/tillage_update_body.dart';
import 'package:flutter/material.dart';

class TillageUpdate extends StatelessWidget {
  final Size deviceSize;
  final Tillage tillage;

  const TillageUpdate({Key key, this.deviceSize, this.tillage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: TillageUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Tillage',
        heroTag: "assets/images/tillage.jpg",
        tillage: tillage,
      ),
    );
  }
}
