import 'package:flutter/material.dart';

class FuelDataCard extends StatefulWidget {
  final int fuelIDData;
  final String fuelTypeData;
  final String idCardNoData;
  final int machineIDData;
  final String dateData;
  final Function deleteFunction;

  const FuelDataCard(
      {Key key,
      this.fuelIDData,
      this.deleteFunction,
      this.idCardNoData,
      this.fuelTypeData,
      this.machineIDData,
      this.dateData})
      : super(key: key);

  @override
  _FuelDataCardState createState() => _FuelDataCardState();
}

class _FuelDataCardState extends State<FuelDataCard> {
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
                    "Fuel ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.fuelIDData}",
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
                  "Fuel Type:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.fuelTypeData,
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
                  "Machine Id:",
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
                  "Date:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "${widget.dateData}",
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
