import 'package:flutter/material.dart';

class ExpensesDataCard extends StatefulWidget {
  final int expensesIDData;
  final String productTypeData;
  final String wayBillNoData;
  final int customerIDData;
  final double quantityReceivedData;
  final double expensesRateData;
  final String expensesUnitData;
  final double expensesAmountData;
  final String expensesDateData;
  final String paymentModeData;
  final Function deleteFunction;

  const ExpensesDataCard(
      {Key key,
      this.expensesIDData,
      this.deleteFunction,
      this.productTypeData,
      this.wayBillNoData,
      this.customerIDData,
      this.expensesAmountData,
      this.expensesDateData,
      this.expensesRateData,
      this.expensesUnitData,
      this.paymentModeData,
      this.quantityReceivedData})
      : super(key: key);

  @override
  _ExpensesDataCardState createState() => _ExpensesDataCardState();
}

class _ExpensesDataCardState extends State<ExpensesDataCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            color: Theme.of(context).indicatorColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Expenses ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.expensesIDData}",
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.delete_sharp),
                    onPressed: widget.deleteFunction,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    iconSize: 20,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Type:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.productTypeData,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "WayBill No:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.wayBillNoData,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Customer ID:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.customerIDData}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Mode:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.paymentModeData,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity Received:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.quantityReceivedData}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Unit:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.expensesUnitData}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rate:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.expensesRateData}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Unit:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.expensesUnitData,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.expensesAmountData}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.expensesDateData}" ?? "nill",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
