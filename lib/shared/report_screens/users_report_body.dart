import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/users_models.dart';
import 'package:farm_manager/shared/Constant.dart';
// import 'package:farm_manager/shared/analytics/users_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
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
  List<User> selectedUsers = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  onSortColumn(int columnIndex, bool ascending, List<User> usersList) {
    if (columnIndex == 0) {
      if (ascending) {
        usersList.sort((a, b) => a.id.compareTo(b.id));
      } else {
        usersList.sort((a, b) => b.id.compareTo(a.id));
      }
    }
  }

  deleteSelected(List<User> usersList) async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          usersList.remove(user);
        }
      }
    });
  }

  onSelectRow(bool onSelect, User user) async {
    setState(() {
      if (onSelect) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  TextStyle sortIconstyles = TextStyle(
      fontFamily: 'poppins', fontSize: 16.0, color: Color(0xFFFFAE00));

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            sortAscending: sort,
            sortColumnIndex: 0,
            columns: [
              DataColumn(
                  label: Text(
                    'ID',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the id',
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColumn(columnIndex, ascending, widget.users);
                  }),
              DataColumn(
                  label: Text(
                    'Username',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Username'),
              DataColumn(
                  label: Text(
                    'Password',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Password'),
              DataColumn(
                  label: Text(
                    'Designation',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Designation')
            ],
            rows: widget.users
                .map((user) => DataRow(
                        cells: [
                          DataCell(Text('${user.id}'), onTap: () {
                            print('Selected ${user.id}');
                          }),
                          DataCell(Text('${user.getUsername}')),
                          DataCell(Text('${user.getPassword}')),
                          DataCell(Text('${user.getDesignation}'))
                        ],
                        selected: selectedUsers.contains(user),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, user);
                        }))
                .toList()),
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.only(
            top: 2.0, right: 16.0, left: 16.0, bottom: 8.0),
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Center(
              child: dataBody(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(20.0)),
              OutlinedButton(
                onPressed: () {},
                child: Text('Selected ${selectedUsers.length}'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(20.0)),
              OutlinedButton(
                onPressed: selectedUsers.isEmpty
                    ? null
                    : () {
                        deleteSelected(widget.users);
                      },
                child: Text('Delete Selected'),
              )
            ],
          ),
          // dataTable()
        ]),
      ),
    );
  }
}
