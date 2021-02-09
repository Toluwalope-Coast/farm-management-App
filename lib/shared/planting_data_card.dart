import 'package:flutter/material.dart';

class PlantingDataCard extends StatefulWidget {
  final int plantingIDData;
  final String plantingTypeData;
  final String idCardNoData;
  final double acreageData;
  final int seedsIDData;
  final int machineIDData;
  final double plantingQuantityData;
  final String plantingUnitData;
  final String dateData;
  final Function deleteFunction;

  const PlantingDataCard(
      {Key key,
      this.plantingIDData,
      this.deleteFunction,
      this.idCardNoData,
      this.plantingTypeData,
      this.acreageData,
      this.plantingQuantityData,
      this.plantingUnitData,
      this.machineIDData,
      this.seedsIDData,
      this.dateData})
      : super(key: key);

  @override
  _PlantingDataCardState createState() => _PlantingDataCardState();
}

class _PlantingDataCardState extends State<PlantingDataCard> {
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
                    "Planting ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.plantingIDData}",
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
                  "Planting Type:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.plantingTypeData,
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
                  "Planting Acreage:",
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
                  "Planting Unit:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.plantingUnitData,
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
                  "Planting Quantity:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.plantingQuantityData}",
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
