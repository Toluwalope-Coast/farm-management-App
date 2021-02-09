import 'package:farm_manager/screens/AdminHome.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  final Size deviceSize;
  LoginBody({Key key, @required this.deviceSize}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String _designationSelected;
  List<dynamic> designation = [
    "Admin",
    "Sales Reps",
    "Store Keeper",
    "Garage Attendant",
    "Field Operator"
  ];
  logUserIn(context) {
    print("My Login pressed function is working");
    print("Username is: ${usernameController.text}");
    print("Password is: ${passwordController.text}");
    print("designation is: $_designationSelected");
    if (usernameController.text == "test" &&
        passwordController.text == "admin123" &&
        _designationSelected == "Admin") {
      return navigationReplaceRoute(context, AdminHome());
    } else {
      return customSnackBar(context, "Invalid User Details");
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //     "Invalid User Details",
      //     style: Theme.of(context).textTheme.button,
      //   )),
      // )
      // ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 30.0, right: 5.0, bottom: 16.0, left: 5.0),
        child: Column(children: [
          Center(
              child: Text(
            "Adebola Farm Manager",
            style: Theme.of(context).textTheme.headline2,
          )),
          Center(
              child: Text(
            "Login",
            style: Theme.of(context).textTheme.headline1,
          )),
          Image.asset(
            "assets/images/login.png",
            height: widget.deviceSize.height * 0.35,
          ),
          CustomRoundedContainer(
            deviceSize: widget.deviceSize,
            containerColor: Theme.of(context).secondaryHeaderColor,
            content: CustomTextfield(
              textInputValue: usernameController,
              deviceSize: widget.deviceSize,
              inputIcon:
                  Icon(Icons.person, color: Theme.of(context).accentColor),
              obscureText: false,
              textInputHintStyle: Theme.of(context).textTheme.bodyText2,
              inputType: TextInputType.name,
              textInputHint: "Username",
            ),
          ),
          CustomRoundedContainer(
            deviceSize: widget.deviceSize,
            containerColor: Theme.of(context).secondaryHeaderColor,
            content: CustomTextfield(
              textInputValue: passwordController,
              deviceSize: widget.deviceSize,
              inputIcon: Icon(Icons.lock_rounded,
                  color: Theme.of(context).accentColor),
              inputType: TextInputType.visiblePassword,
              obscureText: true,
              textInputHintStyle: Theme.of(context).textTheme.bodyText2,
              textInputHint: "Password",
              suffixIcon: Icon(Icons.visibility),
            ),
          ),
          CustomRoundedContainer(
              deviceSize: widget.deviceSize,
              containerColor: Theme.of(context).secondaryHeaderColor,
              content: DropdownButton<dynamic>(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(
                    "Select designation",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  items: designation
                      .map((dynamic dropdownItem) => DropdownMenuItem<dynamic>(
                          value: dropdownItem,
                          child: Text(
                            dropdownItem,
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          )))
                      .toList(),
                  value: _designationSelected,
                  onChanged: (dynamic selectedDropdownItem) {
                    setState(() {
                      this._designationSelected = selectedDropdownItem;
                      print(
                          'This is the selected value ${this._designationSelected}');
                    });
                    print(selectedDropdownItem);
                  })),
          RoundedFlatButton(
            deviceSize: widget.deviceSize,
            buttonBackgroundColor: Theme.of(context).accentColor,
            buttonTextValue: "Login",
            buttonTextStyle: Theme.of(context).textTheme.button,
            buttonFunction: () => logUserIn(context),
          ),
          RichText(
            textAlign: TextAlign.center,
            softWrap: true,
            text:
                TextSpan(style: Theme.of(context).textTheme.caption, children: [
              TextSpan(text: "Do not have an account ?"),
              TextSpan(
                  style: Theme.of(context).textTheme.subtitle2,
                  text: "\nContact Farm Admin")
            ]),
          )
        ]));
  }
}
