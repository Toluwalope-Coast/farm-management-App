import 'package:farm_manager/models/tillage_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/tillage_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class TillageReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Tillage> tillage;
  TillageReportBody({Key key, @required this.deviceSize, this.tillage})
      : super(key: key);

  @override
  _TillageReportBodyState createState() => _TillageReportBodyState();
}

class _TillageReportBodyState extends State<TillageReportBody> {
  List<Tillage> selectedTillage = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Tillage> tillagesList) {
    if (columnIndex == 0) {
      if (ascending) {
        tillagesList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        tillagesList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Tillage> tillagesList) async {
    setState(() {
      if (selectedTillage.isNotEmpty) {
        List<Tillage> temp = [];
        temp.addAll(selectedTillage);
        for (Tillage user in temp) {
          tillagesList.remove(user);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Tillage tillage) async {
    setState(() {
      if (onSelect) {
        selectedTillage.add(tillage);
      } else {
        selectedTillage.remove(tillage);
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
                    onSortColumn(columnIndex, ascending, widget.tillage);
                  }),
              DataColumn(
                  label: Text(
                    'Tillage Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Tillage Type'),
              DataColumn(
                  label: Text(
                    'ID Card No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the ID Card No'),
              DataColumn(
                  label: Text(
                    'Machine ID',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Machine ID'),
              DataColumn(
                  label: Text(
                    'Acreage Done',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Acreage Done'),
              DataColumn(
                  label: Text(
                    'Date Recorded',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Recorded')
            ],
            rows: widget.tillage
                .map((tillage) => DataRow(
                        cells: [
                          DataCell(Text('${tillage.getId}'), onTap: () {
                            print('Selected ${tillage.getId}');
                          }),
                          DataCell(Text('${tillage.getType}')),
                          DataCell(Text('${tillage.getIdCardNo}')),
                          DataCell(Text('${tillage.getMachineId}')),
                          DataCell(Text('${tillage.getAcreage}')),
                          DataCell(Text('${tillage.getDate}'))
                        ],
                        selected: selectedTillage.contains(tillage),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, tillage);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Tillage Report"),
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
                  child: Text('Selected ${selectedTillage.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedTillage.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.tillage);
                        },
                  child: Text('Delete Selected'),
                )
              ],
            ),
            // da
          ],
        ),
      ),
    );
  }
}
