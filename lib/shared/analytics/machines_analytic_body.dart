import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:flutter/material.dart';

class MachinesAnalyticsBody extends StatelessWidget {
  final Size deviceSize;
  MachinesAnalyticsBody({Key key, @required this.deviceSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    drawerList(context);
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: customerAppBar("Machines Analytics"),
        drawer: CustomDrawer(
          deviceSize: deviceSize,
          drawerMenuList: drawerList(context),
        ));
  }
}
