import 'package:farm_manager/models/seeds_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class SeedsReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Seed> seeds;
  SeedsReportBody({Key key, @required this.deviceSize, this.seeds})
      : super(key: key);

  @override
  _SeedsReportBodyState createState() => _SeedsReportBodyState();
}

class _SeedsReportBodyState extends State<SeedsReportBody> {
  List<Seed> selectedSeeds = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Seed> seedsList) {
    if (columnIndex == 0) {
      if (ascending) {
        seedsList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        seedsList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Seed> seedsList) async {
    setState(() {
      if (selectedSeeds.isNotEmpty) {
        List<Seed> temp = [];
        temp.addAll(selectedSeeds);
        for (Seed seed in temp) {
          seedsList.remove(seed);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Seed seed) async {
    setState(() {
      if (onSelect) {
        selectedSeeds.add(seed);
      } else {
        selectedSeeds.remove(seed);
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
                    onSortColumn(columnIndex, ascending, widget.seeds);
                  }),
              DataColumn(
                  label: Text(
                    'Seed Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Seed Type'),
              DataColumn(
                  label: Text(
                    'ID Card No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the ID Card No'),
              DataColumn(
                  label: Text(
                    'Quantity Used',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Quantity Used'),
              DataColumn(
                  label: Text(
                    'Unit',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Unit'),
              DataColumn(
                  label: Text(
                    'Quantity Remaining',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Quantity Remaining'),
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
            rows: widget.seeds
                .map((seeds) => DataRow(
                        cells: [
                          DataCell(Text('${seeds.getId}'), onTap: () {
                            print('Selected ${seeds.getId}');
                          }),
                          DataCell(Text('${seeds.getType}')),
                          DataCell(Text('${seeds.getIdCardNo}')),
                          DataCell(Text('${seeds.getQty}')),
                          DataCell(Text('${seeds.getUnit}')),
                          DataCell(Text('${seeds.getQtyRemaining}')),
                          DataCell(Text('${seeds.getAcreage}')),
                          DataCell(Text('${seeds.getDate}')),
                        ],
                        selected: selectedSeeds.contains(seeds),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, seeds);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Seeds Report"),
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
                  child: Text('Selected ${selectedSeeds.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedSeeds.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.seeds);
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
