import 'package:farm_manager/models/seeds_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/seeds_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class SeedsReportBody extends StatelessWidget {
  final Size deviceSize;
  final List<Seed> seeds;
  SeedsReportBody({Key key, @required this.deviceSize, this.seeds})
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
      appBar: customerAppBar("Seeds Report"),
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
                "Seeds Report Table",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: TextButton(
                    onPressed: () => navigatePushTo(context, SeedsAnalytics()),
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
