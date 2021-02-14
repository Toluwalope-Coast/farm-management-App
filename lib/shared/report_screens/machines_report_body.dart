import 'package:farm_manager/models/machineries_model.dart';
import 'package:farm_manager/shared/Constant.dart';
// import 'package:farm_manager/shared/analytics/machines_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class MachinesReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Machinery> machines;
  MachinesReportBody({Key key, @required this.deviceSize, this.machines})
      : super(key: key);

  @override
  _MachinesReportBodyState createState() => _MachinesReportBodyState();
}

class _MachinesReportBodyState extends State<MachinesReportBody> {
  List<Machinery> selectedMachinery = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Machinery> machinesList) {
    if (columnIndex == 0) {
      if (ascending) {
        machinesList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        machinesList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Machinery> machinesList) async {
    setState(() {
      if (selectedMachinery.isNotEmpty) {
        List<Machinery> temp = [];
        temp.addAll(selectedMachinery);
        for (Machinery machine in temp) {
          machinesList.remove(machine);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Machinery machinery) async {
    setState(() {
      if (onSelect) {
        selectedMachinery.add(machinery);
      } else {
        selectedMachinery.remove(machinery);
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
                    onSortColumn(columnIndex, ascending, widget.machines);
                  }),
              DataColumn(
                  label: Text(
                    'Machine Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Machine Type'),
              DataColumn(
                  label: Text(
                    'ID Card No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the ID Card No'),
              DataColumn(
                  label: Text(
                    'Date Recorded',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Recorded')
            ],
            rows: widget.machines
                .map((machine) => DataRow(
                        cells: [
                          DataCell(Text('${machine.getId}'), onTap: () {
                            print('Selected ${machine.getId}');
                          }),
                          DataCell(Text('${machine.getType}')),
                          DataCell(Text('${machine.getIdCardNo}')),
                          DataCell(Text('${machine.getDate}')),
                        ],
                        selected: selectedMachinery.contains(machine),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, machine);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Machines Report"),
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
                  child: Text('Selected ${selectedMachinery.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedMachinery.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.machines);
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
