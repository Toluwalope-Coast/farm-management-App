import 'package:farm_manager/models/chemicals_model.dart';
import 'package:farm_manager/shared/Constant.dart';
// import 'package:farm_manager/shared/analytics/chemical_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class ChemicalsReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Chemical> chemical;
  ChemicalsReportBody({Key key, @required this.deviceSize, this.chemical})
      : super(key: key);

  @override
  _ChemicalsReportBodyState createState() => _ChemicalsReportBodyState();
}

class _ChemicalsReportBodyState extends State<ChemicalsReportBody> {
  List<Chemical> selectedChemical = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Chemical> chemicalsList) {
    if (columnIndex == 0) {
      if (ascending) {
        chemicalsList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        chemicalsList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Chemical> chemicalsList) async {
    setState(() {
      if (selectedChemical.isNotEmpty) {
        List<Chemical> temp = [];
        temp.addAll(selectedChemical);
        for (Chemical chemical in temp) {
          chemicalsList.remove(chemical);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Chemical chemical) async {
    setState(() {
      if (onSelect) {
        selectedChemical.add(chemical);
      } else {
        selectedChemical.remove(chemical);
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
                    onSortColumn(columnIndex, ascending, widget.chemical);
                  }),
              DataColumn(
                  label: Text(
                    'Chemical Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Chemical Type'),
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
            rows: widget.chemical
                .map((chemical) => DataRow(
                        cells: [
                          DataCell(Text('${chemical.getId}'), onTap: () {
                            print('Selected ${chemical.getId}');
                          }),
                          DataCell(Text('${chemical.getType}')),
                          DataCell(Text('${chemical.getIdCardNo}')),
                          DataCell(Text('${chemical.getMachineId}')),
                          DataCell(Text('${chemical.getAcreage}')),
                          DataCell(Text('${chemical.getDate}'))
                        ],
                        selected: selectedChemical.contains(chemical),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, chemical);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Chemicals Report"),
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
                  child: Text('Selected ${selectedChemical.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedChemical.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.chemical);
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
