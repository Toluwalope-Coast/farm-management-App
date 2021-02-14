import 'package:farm_manager/models/incomes_models.dart';
import 'package:farm_manager/shared/Constant.dart';
// import 'package:farm_manager/shared/analytics/income_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class IncomesReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Income> incomes;
  IncomesReportBody({Key key, @required this.deviceSize, this.incomes})
      : super(key: key);

  @override
  _IncomesReportBodyState createState() => _IncomesReportBodyState();
}

class _IncomesReportBodyState extends State<IncomesReportBody> {
  List<Income> selectedIncome = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Income> incomesList) {
    if (columnIndex == 0) {
      if (ascending) {
        incomesList.sort((a, b) => a.id.compareTo(b.id));
      } else {
        incomesList.sort((a, b) => b.id.compareTo(a.id));
      }
    }
  }

  deleteSelected(List<Income> incomesList) async {
    setState(() {
      if (selectedIncome.isNotEmpty) {
        List<Income> temp = [];
        temp.addAll(selectedIncome);
        for (Income income in temp) {
          incomesList.remove(income);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Income income) async {
    setState(() {
      if (onSelect) {
        selectedIncome.add(income);
      } else {
        selectedIncome.remove(income);
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
                    onSortColumn(columnIndex, ascending, widget.incomes);
                  }),
              DataColumn(
                  label: Text(
                    'Product Type',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Income Type'),
              DataColumn(
                  label: Text(
                    'Waybill No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Waybill No'),
              DataColumn(
                  label: Text(
                    'Customer Id',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Customer Id'),
              DataColumn(
                  label: Text(
                    'Payment Mode',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Payment Mode'),
              DataColumn(
                  label: Text(
                    'Quantity Sold',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Quantity Sold'),
              DataColumn(
                  label: Text(
                    'Unit',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Unit'),
              DataColumn(
                  label: Text(
                    'Rate',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Rate'),
              DataColumn(
                  label: Text(
                    'Amount',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Amount'),
              DataColumn(
                  label: Text(
                    'Date Recorded',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Recorded')
            ],
            rows: widget.incomes
                .map((income) => DataRow(
                        cells: [
                          DataCell(Text('${income.id}'), onTap: () {
                            print('Selected ${income.id}');
                          }),
                          DataCell(Text('${income.getProductType}')),
                          DataCell(Text('${income.getWaybillNo}')),
                          DataCell(Text('${income.getCustomerID}')),
                          DataCell(Text('${income.getPaymentMode}')),
                          DataCell(Text('${income.getQtySold}')),
                          DataCell(Text('${income.getUnit}')),
                          DataCell(Text('${income.getRate}')),
                          DataCell(Text('${income.getAmountSold}')),
                          DataCell(Text('${income.getDate}')),
                        ],
                        selected: selectedIncome.contains(income),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, income);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Incomes Report"),
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
                  child: Text('Selected ${selectedIncome.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedIncome.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.incomes);
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
