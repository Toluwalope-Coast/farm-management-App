import 'package:flutter/material.dart';

class DataGridList extends StatelessWidget {
  final Size deviceSize;
  final List ctaLists;
  final Widget cardDisplay;
  DataGridList(
      {Key key, @required this.deviceSize, this.ctaLists, this.cardDisplay})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: deviceSize.height * 0.75),
        child: GridView.count(
          padding: EdgeInsets.only(top: 8.0, bottom: 35.0),
          mainAxisSpacing: 16.0,
          crossAxisCount: 1,
          children: List.generate(
            ctaLists.length,
            (index) => cardDisplay,
          ),
        ));
  }
}
