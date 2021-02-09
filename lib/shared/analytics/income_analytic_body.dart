import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:flutter/material.dart';

class IncomeAnalyticsBody extends StatelessWidget {
  final Size deviceSize;
  IncomeAnalyticsBody({Key key, @required this.deviceSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    drawerList(context);
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: customerAppBar("Income Analytics"),
        drawer: CustomDrawer(
          deviceSize: deviceSize,
          drawerMenuList: drawerList(context),
        ));
  }
}
