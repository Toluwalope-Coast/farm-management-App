import 'package:farm_manager/models/harvesting_model.dart';
import 'package:farm_manager/shared/Constant.dart';
// import 'package:farm_manager/shared/analytics/harvesting_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/insert_screens.dart/harvesting_insert.dart';
import 'package:flutter/material.dart';

class HarvestingReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Harvesting> harvesting;
  HarvestingReportBody({Key key, @required this.deviceSize, this.harvesting})
      : super(key: key);

  @override
  _HarvestingReportBodyState createState() => _HarvestingReportBodyState();
}

class _HarvestingReportBodyState extends State<HarvestingReportBody> {
  List<Harvesting> selectedHarvesting = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(
      int columnIndex, bool ascending, List<Harvesting> harvestingList) {
    if (columnIndex == 0) {
      if (ascending) {
        harvestingList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        harvestingList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Harvesting> harvestingList) async {
    setState(() {
      if (selectedHarvesting.isNotEmpty) {
        List<Harvesting> temp = [];
        temp.addAll(selectedHarvesting);
        for (Harvesting harvest in temp) {
          harvestingList.remove(harvest);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Harvesting harvesting) async {
    setState(() {
      if (onSelect) {
        selectedHarvesting.add(harvesting);
      } else {
        selectedHarvesting.remove(HarvestingInsert());
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
                    onSortColumn(columnIndex, ascending, widget.harvesting);
                  }),
              DataColumn(
                  label: Text(
                    'Harvest Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Harvest Type'),
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
                    'Seed ID',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Seed ID'),
              DataColumn(
                  label: Text(
                    'Quantity Harvested',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Quantity Harvested'),
              DataColumn(
                  label: Text(
                    'Unit',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Unit'),
              DataColumn(
                  label: Text(
                    'Quantity Left in Store',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Quantity Left in Store'),
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
            rows: widget.harvesting
                .map((harvest) => DataRow(
                        cells: [
                          DataCell(Text('${harvest.getId}'), onTap: () {
                            print('Selected ${harvest.getId}');
                          }),
                          DataCell(Text('${harvest.getType}')),
                          DataCell(Text('${harvest.getIdCardNo}')),
                          DataCell(Text('${harvest.getMachineId}')),
                          DataCell(Text('${harvest.getSeedId}')),
                          DataCell(Text('${harvest.getQty}')),
                          DataCell(Text('${harvest.getUnit}')),
                          DataCell(Text('${harvest.getTotalQtyStock}')),
                          DataCell(Text('${harvest.getAcreage}')),
                          DataCell(Text('${harvest.getDate}')),
                        ],
                        selected: selectedHarvesting.contains(harvest),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, harvest);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Harvesting Report"),
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
                  child: Text('Selected ${selectedHarvesting.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedHarvesting.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.harvesting);
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
