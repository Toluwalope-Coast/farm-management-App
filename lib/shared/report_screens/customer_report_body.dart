import 'package:farm_manager/models/customers_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/analytics/Staff_analytics.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:flutter/material.dart';

class CustomerReportBody extends StatefulWidget {
  final Size deviceSize;
  final List<Customer> customer;
  CustomerReportBody({Key key, @required this.deviceSize, this.customer})
      : super(key: key);

  @override
  _CustomerReportBodyState createState() => _CustomerReportBodyState();
}

class _CustomerReportBodyState extends State<CustomerReportBody> {
  List<Customer> selectedCustomer = [];
  bool sort;

  @override
  void initState() {
    sort = false;
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending, List<Customer> customersList) {
    if (columnIndex == 0) {
      if (ascending) {
        customersList.sort((a, b) => a.getId.compareTo(b.getId));
      } else {
        customersList.sort((a, b) => b.getId.compareTo(a.getId));
      }
    }
  }

  deleteSelected(List<Customer> customersList) async {
    setState(() {
      if (selectedCustomer.isNotEmpty) {
        List<Customer> temp = [];
        temp.addAll(selectedCustomer);
        for (Customer customer in temp) {
          customersList.remove(customer);
        }
      }
    });
  }

  onSelectRow(bool onSelect, Customer customer) async {
    setState(() {
      if (onSelect) {
        selectedCustomer.add(customer);
      } else {
        selectedCustomer.remove(customer);
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
                    onSortColumn(columnIndex, ascending, widget.customer);
                  }),
              DataColumn(
                  label: Text(
                    'Name',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Name'),
              DataColumn(
                  label: Text(
                    'Mode Of Transaction',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Mode Of Transaction'),
              DataColumn(
                  label: Text(
                    'Office Address',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Office Address'),
              DataColumn(
                  label: Text(
                    'email',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the email'),
              DataColumn(
                  label: Text(
                    'Telephone No',
                    style: sortIconstyles,
                  ),
                  numeric: false,
                  tooltip: 'This is the Telephone No'),
              DataColumn(
                  label: Text(
                    'Date Registered',
                    style: sortIconstyles,
                  ),
                  numeric: true,
                  tooltip: 'This is the Date Registered')
            ],
            rows: widget.customer
                .map((customer) => DataRow(
                        cells: [
                          DataCell(Text('${customer.getId}'), onTap: () {
                            print('Selected ${customer.getId}');
                          }),
                          DataCell(Text('${customer.getName}')),
                          DataCell(Text('${customer.getModeOfTransaction}')),
                          DataCell(Text('${customer.getAddress}')),
                          DataCell(Text('${customer.getEmail}')),
                          DataCell(Text('${customer.getTelNo}')),
                          DataCell(Text('${customer.getDate}')),
                        ],
                        selected: selectedCustomer.contains(customer),
                        onSelectChanged: (b) {
                          print('Onselect');
                          onSelectRow(b, customer);
                        }))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Customer Report"),
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
                  child: Text('Selected ${selectedCustomer.length}'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                OutlinedButton(
                  onPressed: selectedCustomer.isEmpty
                      ? null
                      : () {
                          deleteSelected(widget.customer);
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
