import 'package:farm_manager/models/chemicals_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/chemical_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class ChemicalsReportBody extends StatelessWidget {
  final Size deviceSize;
  final List<Chemical> chemical;
  ChemicalsReportBody({Key key, @required this.deviceSize, this.chemical})
      : super(key: key);

  // Container(
  //     child: DataTable(
  //       columns: [
  //         DataColumn(label: Text('Id')),
  //         DataColumn(label: Text('Name')),
  //         DataColumn(label: Text('Price')),
  //       ],
  //       rows: List<DataRow>.generate(
  //           products.length,
  //           (index) => DataRow(cells: [
  //                 DataCell(Text(products[index].productId)),
  //                 DataCell(Text(products[index].name)),
  //                 DataCell(Text(products[index].price.toString())),
  //               ])),
  //     ),
  //   ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Chemicals Report"),
      drawer: CustomDrawer(
        deviceSize: deviceSize,
        drawerMenuList: drawerList(context),
      ),
      body: ListView(
        padding:
            EdgeInsets.only(top: 2.0, right: 16.0, left: 16.0, bottom: 8.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chemicals Report Table",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: TextButton(
                    onPressed: () =>
                        navigatePushTo(context, ChemicalAnalytics()),
                    child: Container(
                        color: Theme.of(context).buttonColor,
                        child: Text(
                          "Analytics",
                          style: Theme.of(context).textTheme.bodyText1,
                        ))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
