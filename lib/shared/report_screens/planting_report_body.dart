import 'package:farm_manager/models/planting_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/planting_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class PlantingReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Planting> planting;
  PlantingReportBody({Key key, @required this.deviceSize, this.planting})
      : super(key: key);

  @override
  _PlantingReportBodyState createState() => _PlantingReportBodyState();
}

class _PlantingReportBodyState extends State<PlantingReportBody> {
  List<Planting> selectedPlanting = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Planting> plantingList) {
    if (columnIndex == 0) {
      if (ascending) {
        plantingList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        plantingList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Planting> plantingList) async {
    setState(() {
      if (selectedPlanting.isNotEmpty) {
        List<Planting> temp = [];
        temp.addAll(selectedPlanting);
        for (Planting planting in temp) {
          plantingList.remove(planting);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Planting planting) async {
    setState(() {
      if (onSelect) {
        selectedPlanting.add(planting);
      } else {
        selectedPlanting.remove(planting);
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
                    onSortColumn(columnIndex, ascending, widget.planting);
                  }),
              DataColumn(
                  label: Text(
                    'Planting Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Planting Type'),
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
                  numeric: false,
                  tooltip: 'This is the Machine ID'),
              DataColumn(
                  label: Text(
                    'Seed ID',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Seed ID'),
              DataColumn(
                  label: Text(
                    'Quantity Planted',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Quantity Planted'),
              DataColumn(
                  label: Text(
                    'Unit',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Unit'),
              DataColumn(
                  label: Text(
                    'Acreage Covered',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Acreage Covered'),
              DataColumn(
                  label: Text(
                    'Date Recorded',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Recorded')
            ],
            rows: widget.planting
                .map((planting) => DataRow(
                        cells: [
                          DataCell(Text('${planting.getId}'), onTap: () {
                            print('Selected ${planting.getId}');
                          }),
                          DataCell(Text('${planting.getType}')),
                          DataCell(Text('${planting.getIdCardNo}')),
                          DataCell(Text('${planting.getMachineId}')),
                          DataCell(Text('${planting.getSeedId}')),
                          DataCell(Text('${planting.getQty}')),
                          DataCell(Text('${planting.getUnit}')),
                          DataCell(Text('${planting.getAcreage}')),
                          DataCell(Text('${planting.getDate}')),
                        ],
                        selected: selectedPlanting.contains(planting),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, planting);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Planting Report"),
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
                  child: Text('Selected ${selectedPlanting.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedPlanting.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.planting);
                        },
                  child: Text('Delete Selected'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
