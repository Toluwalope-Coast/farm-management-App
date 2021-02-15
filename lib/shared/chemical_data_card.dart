import 'package:flutter/material.dart';

class ChemicalDataCard extends StatefulWidget {
  final String chemicalIDData;
  final String chemicalTypeData;
  final String idCardNoData;
  final String machineIDData;
  final double acreageData;
  final String dateData;

  const ChemicalDataCard({
    Key key,
    this.chemicalIDData,
    this.idCardNoData,
    this.chemicalTypeData,
    this.acreageData,
    this.machineIDData,
    this.dateData,
  }) : super(key: key);

  @override
  _ChemicalDataCardState createState() => _ChemicalDataCardState();
}

class _ChemicalDataCardState extends State<ChemicalDataCard> {
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
                    "Chemical ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.chemicalIDData}",
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
                  "Chemical Type:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.chemicalTypeData,
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
                  "Id Card No:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.idCardNoData,
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
                  "Machine Id No:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.machineIDData}",
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
                  "Acreage:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.acreageData}",
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
                  "${widget.dateData}" ?? "nill",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
