import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/harvesting_update_body.dart';
import 'package:flutter/material.dart';

class HarvestingUpdate extends StatelessWidget {
  final Size deviceSize;
  final String index;
  final Map<dynamic, dynamic> dbQuery;

  const HarvestingUpdate({
    Key key,
    this.deviceSize,
    this.index,
    this.dbQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: HarvestingUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Harvesting',
        heroTag: "assets/images/harvesting.jpg",
        index: index,
        dbQuery: dbQuery,
      ),
    );
  }
}
