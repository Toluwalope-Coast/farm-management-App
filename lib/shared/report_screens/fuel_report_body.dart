import 'package:farm_manager/models/fuels_model.dart';
import 'package:farm_manager/shared/Constant.dart';
// import 'package:farm_manager/shared/analytics/fuel_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class FuelReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Fuel> fuel;
  FuelReportBody({Key key, @required this.deviceSize, this.fuel})
      : super(key: key);

  @override
  _FuelReportBodyState createState() => _FuelReportBodyState();
}

class _FuelReportBodyState extends State<FuelReportBody> {
  List<Fuel> selectedFuel = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Fuel> fuelList) {
    if (columnIndex == 0) {
      if (ascending) {
        fuelList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        fuelList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Fuel> fuelList) async {
    setState(() {
      if (selectedFuel.isNotEmpty) {
        List<Fuel> temp = [];
        temp.addAll(selectedFuel);
        for (Fuel fuel in temp) {
          fuelList.remove(fuel);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Fuel fuel) async {
    setState(() {
      if (onSelect) {
        selectedFuel.add(fuel);
      } else {
        selectedFuel.remove(fuel);
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
                    onSortColumn(columnIndex, ascending, widget.fuel);
                  }),
              DataColumn(
                  label: Text(
                    'Fuel Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Fuel Type'),
              DataColumn(
                  label: Text(
                    'ID Card No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the ID Card No'),
              DataColumn(
                  label: Text(
                    'Machine Id',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Machine Id'),
              DataColumn(
                  label: Text(
                    'Date Recorded',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Recorded')
            ],
            rows: widget.fuel
                .map((fuel) => DataRow(
                        cells: [
                          DataCell(Text('${fuel.getId}'), onTap: () {
                            print('Selected ${fuel.getId}');
                          }),
                          DataCell(Text('${fuel.getType}')),
                          DataCell(Text('${fuel.getIdCardNo}')),
                          DataCell(Text('${fuel.getMachineId}')),
                          DataCell(Text('${fuel.getDate}')),
                        ],
                        selected: selectedFuel.contains(fuel),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, fuel);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Fuel Report"),
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
                  child: Text('Selected ${selectedFuel.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedFuel.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.fuel);
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
