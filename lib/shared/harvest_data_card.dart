import 'package:flutter/material.dart';

class HarvestDataCard extends StatefulWidget {
  final int harvestIDData;
  final String harvestTypeData;
  final String idCardNoData;
  final double acreageData;
  final int seedsIDData;
  final int machineIDData;
  final double harvestQuantityData;
  final String dateData;
  final Function deleteFunction;

  const HarvestDataCard(
      {Key key,
      this.harvestIDData,
      this.deleteFunction,
      this.idCardNoData,
      this.harvestTypeData,
      this.acreageData,
      this.harvestQuantityData,
      this.machineIDData,
      this.seedsIDData,
      this.dateData})
      : super(key: key);

  @override
  _HarvestDataCardState createState() => _HarvestDataCardState();
}

class _HarvestDataCardState extends State<HarvestDataCard> {
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
                    "Harvest ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.harvestIDData}",
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
                  "Harvest Type:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.harvestTypeData,
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
                  "Harvest Acreage:",
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
                  "Harvest Quantity:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.harvestQuantityData}",
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
