import 'package:flutter/material.dart';

class StaffDataCard extends StatefulWidget {
  final String staffIDData;
  final String firstnameData;
  final String lastnameData;
  final String usernameData;
  final String designationData;
  final String idCardNoData;
  final String emailData;
  final String addressData;
  final String cityData;
  final String telNoData;
  final String dateData;

  const StaffDataCard(
      {Key key,
      this.usernameData,
      this.designationData,
      this.staffIDData,
      this.firstnameData,
      this.lastnameData,
      this.idCardNoData,
      this.emailData,
      this.addressData,
      this.cityData,
      this.telNoData,
      this.dateData})
      : super(key: key);

  @override
  _StaffDataCardState createState() => _StaffDataCardState();
}

class _StaffDataCardState extends State<StaffDataCard> {
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
                    "Staff ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.staffIDData}",
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
                  "Firstname:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.firstnameData,
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
                  "Lastname:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.lastnameData,
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
                  "Username:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.usernameData,
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
                  "Designation:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.designationData,
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
                  "Email:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.emailData,
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
                  "Home Address:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.addressData,
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
                  "City:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.cityData,
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
                  "Tel. No:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.telNoData,
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
                  "Emp Date:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.dateData ?? "nill",
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
