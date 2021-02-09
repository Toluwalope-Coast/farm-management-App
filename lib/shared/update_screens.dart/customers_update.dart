import 'package:farm_manager/models/customers_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/update_screens.dart/customer_update_body.dart';
import 'package:flutter/material.dart';

class CustomerUpdate extends StatelessWidget {
  final Size deviceSize;
  final Customer customer;

  const CustomerUpdate({Key key, this.deviceSize, this.customer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: CustomerUpdateBody(
          deviceSize: deviceSize,
          profileImage:
              Container(height: 50.0, width: 70.0, child: profileImage()),
          title: 'Customer',
          heroTag: "assets/images/customers.jpg",
          customer: customer),
    );
  }
}
