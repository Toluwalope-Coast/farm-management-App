import 'package:farm_manager/models/customers_model.dart';
import 'package:farm_manager/shared/background_2.dart';
import 'package:farm_manager/shared/report_screens/customer_report_body.dart';
import 'package:flutter/material.dart';

class CustomerReport extends StatelessWidget {
  final List<Customer> customer;

  const CustomerReport({Key key, this.customer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Background2(
      deviceSize: deviceSize,
      body: CustomerReportBody(deviceSize: deviceSize, customer: customer),
    );
  }
}
