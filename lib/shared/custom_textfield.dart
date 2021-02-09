import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Size deviceSize;
  final TextEditingController textInputValue;
  final Icon inputIcon;
  final Icon suffixIcon;
  final bool obscureText;
  final TextInputType inputType;
  final FocusNode inputFocusNode;
  final TextStyle textInputHintStyle;
  final String textInputHint;
  CustomTextfield(
      {Key key,
      this.deviceSize,
      this.inputIcon,
      this.suffixIcon,
      this.obscureText,
      this.inputType,
      this.textInputHint,
      this.textInputHintStyle,
      this.textInputValue,
      this.inputFocusNode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textInputValue,
      style: Theme.of(context).textTheme.bodyText2,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: textInputHint,
          hintStyle: textInputHintStyle,
          icon: inputIcon,
          suffixIcon: suffixIcon),
      focusNode: inputFocusNode,
    );
  }
}
