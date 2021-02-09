import 'dart:core';

import 'package:farm_manager/models/users_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/users_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class UserReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<User> users;
  UserReportBody({Key key, @required this.deviceSize, this.users})
      : super(key: key);

  @override
  _UserReportBodyState createState() => _UserReportBodyState();
}

class _UserReportBodyState extends State<UserReportBody> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List usersKeysDataList;
  List usersValuesDataList;
  List usersRowsDataList = [];
  List<DataColumn> usersKeysList = [];
  List<DataRow> usersValuesList = [];
  List<DataCell> usersCellList = [];
// List<Map> result = await db.rawQuery('SELECT * FROM $tableName');
//     result.forEach((map) {
//       var keys = map.keys;
//       var values = map.values;
//       keys.toList();
//       values.toList();
//       print('List of Keys: $keys');
//       print('List of Values: $values');
//     });

  updateDataTableData() async {
    final userDataList = await databaseHelper.getUsersMapList();
    userDataList.forEach((usersData) {
      this.usersKeysDataList = usersData.keys.toList();
      print('this is the value in usersKeysDataList $usersKeysDataList');
      this.usersValuesDataList = usersData.values.toList();
      print('this is the value in usersValuesDataList $usersValuesDataList');
      this.usersRowsDataList.add(usersValuesDataList);
      print('this is the value in usersRowsDataList $usersRowsDataList');
    });
  }

  List<DataColumn> columnLooper(
      List dataList, List<DataColumn> dataColumnList) {
    print('This is the number of columns ${dataColumnList.length}');
    for (String i in dataList) {
      print('This is the column value $i');
      dataColumnList.add(DataColumn(label: Text(i)));
    }
    return dataColumnList;
  }

  List<DataCell> cellLooper(List dataList, List<DataCell> dataCellList) {
    print('this is the number of cell in each row ${dataCellList.length}');
    for (dynamic i in dataList) {
      print('this is the value used in cell $i');

      dataCellList.add(DataCell(Text(i.toString())));
    }
    return dataCellList;
  }

  DataRow rowSetter(List<DataCell> dataCellList) {
    return DataRow(cells: dataCellList);
  }

  List<DataRow> rowLooper(
      List dataList, List<DataRow> dataRowList, List<DataCell> dataCellList) {
    for (List column in dataList) {
      print('this is the value used in column $column');

      dataRowList.add(rowSetter(cellLooper(column, dataCellList)));
      // dataCellList.add(DataCell(Text(cell.toString())));
    }
    dataRowList.add(rowSetter(dataCellList));
    return dataRowList;
  }

  Widget dataTable() {
    print("These are the values $usersKeysDataList");
    print("These are the keys $usersValuesDataList");
    if (usersValuesDataList != null) {
      try {
        return DataTable(
            columns: columnLooper(usersKeysDataList, usersKeysList),
            rows: rowLooper(usersRowsDataList, usersValuesList, usersCellList));
      } catch (err) {
        print(err);
        return Container();
      }
    } else {
      updateDataTableData();
      try {
        return DataTable(
            columns: columnLooper(usersKeysDataList, usersKeysList),
            rows: rowLooper(usersRowsDataList, usersValuesList, usersCellList));
      } catch (err) {
        print(err);
        return Container();
      }
      // return Text("No Report Exists for the Users");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Users Report"),
      drawer: CustomDrawer(
        deviceSize: widget.deviceSize,
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
                  "Users Report Table",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextButton(
                      onPressed: () =>
                          navigatePushTo(context, UsersAnalytics()),
                      child: Container(
                          color: Theme.of(context).buttonColor,
                          child: Text(
                            "Analytics",
                            style: Theme.of(context).textTheme.bodyText1,
                          ))),
                )
              ],
            ),
            dataTable()
          ]),
    );
  }
}
