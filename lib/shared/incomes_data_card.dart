import 'package:flutter/material.dart';

class IncomesDataCard extends StatefulWidget {
  final String incomeIDData;
  final String productTypeData;
  final String wayBillNoData;
  final String customerIDData;
  final double quantitySoldData;
  final double incomeRateData;
  final String incomeUnitData;
  final double incomeAmountData;
  final String incomeDateData;
  final String paymentModeData;

  const IncomesDataCard({
    Key key,
    this.incomeIDData,
    this.productTypeData,
    this.wayBillNoData,
    this.customerIDData,
    this.incomeAmountData,
    this.incomeDateData,
    this.incomeRateData,
    this.incomeUnitData,
    this.paymentModeData,
    this.quantitySoldData,
  }) : super(key: key);

  @override
  _IncomesDataCardState createState() => _IncomesDataCardState();
}

class _IncomesDataCardState extends State<IncomesDataCard> {
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
                    "Income ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.incomeIDData}",
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.right,
                  ),
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
                  "Quantity Sold:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.quantitySoldData}",
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
                  "${widget.incomeUnitData}",
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
                  "${widget.incomeRateData}",
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
                  widget.incomeUnitData,
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
                  "${widget.incomeAmountData}",
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
                  "${widget.incomeDateData}" ?? "nill",
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
