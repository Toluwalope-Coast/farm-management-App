import 'package:farm_manager/models/chemicals_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/chemical_update_body.dart';
import 'package:flutter/material.dart';

class ChemicalUpdate extends StatelessWidget {
  final Size deviceSize;
  final Chemical chemical;

  const ChemicalUpdate({Key key, this.deviceSize, this.chemical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: ChemicalUpdateBody(
          deviceSize: deviceSize,
          profileImage:
              Container(height: 50.0, width: 70.0, child: profileImage()),
          title: 'Chemicals',
          heroTag: "assets/images/chemicals.jpg",
          chemical: chemical),
    );
  }
}
