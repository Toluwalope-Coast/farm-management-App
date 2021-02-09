import 'package:farm_manager/models/users_models.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/users_report_body.dart';
import 'package:flutter/material.dart';

class UsersReport extends StatelessWidget {
  final List<User> users;

  const UsersReport({Key key, this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: UserReportBody(deviceSize: deviceSize, users: users),
    );
  }
}
