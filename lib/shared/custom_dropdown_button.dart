import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final TextStyle dropdownItemStyle;
  final Size deviceSize;
  final List<dynamic> dropdownItemList;
  final Widget dropdownButtonHint;
  // static dynamic selectedItemVariable;
  CustomDropdownButton({
    Key key,
    @required this.deviceSize,
    this.dropdownButtonHint,
    this.dropdownItemList,
    this.dropdownItemStyle,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
        isExpanded: true,
        underline: SizedBox(),
        hint: widget.dropdownButtonHint,
        items: widget.dropdownItemList
            .map((dynamic dropdownItem) => DropdownMenuItem<dynamic>(
                value: dropdownItem ?? widget.dropdownItemList[0],
                child: Text(dropdownItem, style: widget.dropdownItemStyle)))
            .toList(),
        onChanged: (dynamic selectedDropdownItem) {
          // widget.selectedItemVar = selectedDropdownItem;
          print(selectedDropdownItem);
        });
  }
}
