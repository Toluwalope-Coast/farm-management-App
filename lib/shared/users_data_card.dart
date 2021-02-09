import 'package:flutter/material.dart';

class UserDataCard extends StatefulWidget {
  final int userIDData;
  final String usernameData;
  final String passwordData;
  final String designationData;
  final Function deleteFunction;

  const UserDataCard(
      {Key key,
      this.userIDData,
      this.deleteFunction,
      this.usernameData,
      this.passwordData,
      this.designationData})
      : super(key: key);

  @override
  _UserDataCardState createState() => _UserDataCardState();
}

class _UserDataCardState extends State<UserDataCard> {
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
                    "User ID:",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "${widget.userIDData}",
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
                  "Password:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  widget.passwordData,
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
          )
        ],
      ),
    );
  }
}
