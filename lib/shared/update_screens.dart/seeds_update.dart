import 'package:farm_manager/models/seeds_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/seeds_update_body.dart';
import 'package:flutter/material.dart';

class SeedsUpdate extends StatelessWidget {
  final Size deviceSize;
  final Seed seed;

  const SeedsUpdate({Key key, this.deviceSize, this.seed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background2(
      deviceSize: deviceSize,
      body: SeedsUpdateBody(
        deviceSize: deviceSize,
        profileImage:
            Container(height: 50.0, width: 70.0, child: profileImage()),
        title: 'Seeds',
        heroTag: "assets/images/seeds.jpg",
        seed: seed,
      ),
    );
  }
}
