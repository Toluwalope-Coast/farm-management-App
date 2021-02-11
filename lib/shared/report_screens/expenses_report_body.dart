import 'package:farm_manager/models/expenses_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/expenses_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class ExpensesReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Expenses> expenses;
  ExpensesReportBody({Key key, @required this.deviceSize, this.expenses})
      : super(key: key);

  @override
  _ExpensesReportBodyState createState() => _ExpensesReportBodyState();
}

class _ExpensesReportBodyState extends State<ExpensesReportBody> {
  List<Expenses> selectedExpenses = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Expenses> expensesList) {
    if (columnIndex == 0) {
      if (ascending) {
        expensesList.sort((a, b) => a.id.compareTo(b.id));
      } else {
        expensesList.sort((a, b) => b.id.compareTo(a.id));
      }
    }
  }

  deleteSelected(List<Expenses> expensesList) async {
    setState(() {
      if (selectedExpenses.isNotEmpty) {
        List<Expenses> temp = [];
        temp.addAll(selectedExpenses);
        for (Expenses expenses in temp) {
          expensesList.remove(expenses);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Expenses expenses) async {
    setState(() {
      if (onSelect) {
        selectedExpenses.add(expenses);
      } else {
        selectedExpenses.remove(expenses);
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
                    onSortColumn(columnIndex, ascending, widget.expenses);
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
                    'Quantity Received',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Quantity Recieved'),
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
            rows: widget.expenses
                .map((expenses) => DataRow(
                        cells: [
                          DataCell(Text('${expenses.id}'), onTap: () {
                            print('Selected ${expenses.id}');
                          }),
                          DataCell(Text('${expenses.getProductType}')),
                          DataCell(Text('${expenses.getWaybillNo}')),
                          DataCell(Text('${expenses.getCustomerID}')),
                          DataCell(Text('${expenses.getPaymentMode}')),
                          DataCell(Text('${expenses.getQtyRecieved}')),
                          DataCell(Text('${expenses.getUnit}')),
                          DataCell(Text('${expenses.getRate}')),
                          DataCell(Text('${expenses.getAmountRecieved}')),
                          DataCell(Text('${expenses.getDate}')),
                        ],
                        selected: selectedExpenses.contains(expenses),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, expenses);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Expenses Report"),
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
                  child: Text('Selected ${selectedExpenses.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedExpenses.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.expenses);
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
