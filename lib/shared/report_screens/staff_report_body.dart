import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/Staff_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class StaffReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Staff> staff;
  StaffReportBody({Key key, @required this.deviceSize, this.staff})
      : super(key: key);

  @override
  _StaffReportBodyState createState() => _StaffReportBodyState();
}

class _StaffReportBodyState extends State<StaffReportBody> {
  List<Staff> selectedStaffs = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Staff> staffsList) {
    if (columnIndex == 0) {
      if (ascending) {
        staffsList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        staffsList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Staff> staffsList) async {
    setState(() {
      if (selectedStaffs.isNotEmpty) {
        List<Staff> temp = [];
        temp.addAll(selectedStaffs);
        for (Staff user in temp) {
          staffsList.remove(user);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Staff staff) async {
    setState(() {
      if (onSelect) {
        selectedStaffs.add(staff);
      } else {
        selectedStaffs.remove(staff);
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
                    onSortColumn(columnIndex, ascending, widget.staff);
                  }),
              DataColumn(
                  label: Text(
                    'First Name',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the First Name'),
              DataColumn(
                  label: Text(
                    'Last Name',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Last Name'),
              DataColumn(
                  label: Text(
                    'Username',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Username'),
              DataColumn(
                  label: Text(
                    'Designation',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Designation'),
              DataColumn(
                  label: Text(
                    'ID Card No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the ID Card No'),
              DataColumn(
                  label: Text(
                    'email',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the email'),
              DataColumn(
                  label: Text(
                    'Home Address',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Home Address'),
              DataColumn(
                  label: Text(
                    'City',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the City'),
              DataColumn(
                  label: Text(
                    'Telephone No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Telephone No'),
              DataColumn(
                  label: Text(
                    'Date Employed',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Employed')
            ],
            rows: widget.staff
                .map((staff) => DataRow(
                        cells: [
                          DataCell(Text('${staff.getId}'), onTap: () {
                            print('Selected ${staff.getId}');
                          }),
                          DataCell(Text('${staff.getFirstname}')),
                          DataCell(Text('${staff.getLastname}')),
                          DataCell(Text('${staff.getUsername}')),
                          DataCell(Text('${staff.getDesignation}')),
                          DataCell(Text('${staff.getIdCardNo}')),
                          DataCell(Text('${staff.getEmail}')),
                          DataCell(Text('${staff.getHomeAddress}')),
                          DataCell(Text('${staff.getCity}')),
                          DataCell(Text('${staff.getTelNo}')),
                          DataCell(Text('${staff.getEmpDate}')),
                        ],
                        selected: selectedStaffs.contains(staff),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, staff);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Staff Report"),
      drawer: CustomDrawer(
        deviceSize: widget.deviceSize,
        drawerMenuList: drawerList(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 2.0, right: 16.0, left: 16.0, bottom: 8.0),
        child: Column(
          children: [
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
                  child: Text('Selected ${selectedStaffs.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedStaffs.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.staff);
                        },
                  child: Text('Delete Selected'),
                )
              ],
            ),
            //
          ],
        ),
      ),
    );
  }
}
