// import 'package:farm_manager/models/users_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/screens/AdminHome.dart';
import 'package:farm_manager/screens/farm_operator_home.dart';
import 'package:farm_manager/screens/garage_attendant_home.dart';
import 'package:farm_manager/screens/sales_rep_home.dart';
import 'package:farm_manager/screens/store_keeper_home.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
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

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  DatabaseHelper databaseHelper = DatabaseHelper();
  String _designationSelected;
  List<dynamic> designation = [
    "Admin",
    "Sales Reps",
    "Store Keeper",
    "Garage Attendant",
    "Field Operator"
  ];

  // u

  Future logUserIn(context) async {
    print("My Login pressed function is working");
    print("Username is: ${usernameController.text}");
    print("Password is: ${passwordController.text}");
    print("designation is: $_designationSelected");
    dynamic user = await FirebaseFirestore.instance
        .collection('user')
        .where('username', isEqualTo: '${usernameController.text}')
        .where('password', isEqualTo: '${passwordController.text}')
        .where('designation', isEqualTo: '$_designationSelected')
        .get()
        .then((value) => value.docs.length);

    if (usernameController.text == "test" &&
        passwordController.text == "admin123" &&
        _designationSelected == "Admin") {
      return navigationReplaceRoute(context, AdminHome());
    } else if (usernameController.text == "sanusi" &&
        passwordController.text == "salesrep123" &&
        _designationSelected == "Sales Reps") {
      return navigationReplaceRoute(context, SalesRepHome());
    } else if (usernameController.text == "samuel" &&
        passwordController.text == "storekeeper123" &&
        _designationSelected == "Store Keeper") {
      return navigationReplaceRoute(context, StoreKeeperHome());
    } else if (usernameController.text == "paul" &&
        passwordController.text == "garageAttendant123" &&
        _designationSelected == "Garage Attendant") {
      return navigationReplaceRoute(context, GarageAttendantHome());
    } else if (usernameController.text == "james" &&
        passwordController.text == "fieldOperator123" &&
        _designationSelected == "Field Operator") {
      return navigationReplaceRoute(context, FarmOperatorHome());
    } else if (user > 0) {
      if (_designationSelected == "Field Operator") {
        return navigationReplaceRoute(context, FarmOperatorHome());
      } else if (_designationSelected == "Garage Attendant") {
        return navigationReplaceRoute(context, GarageAttendantHome());
      } else if (_designationSelected == "Store Keeper") {
        return navigationReplaceRoute(context, StoreKeeperHome());
      } else if (_designationSelected == "Sales Reps") {
        return navigationReplaceRoute(context, StoreKeeperHome());
      }
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
            content: TextField(
                controller: passwordController,
                style: Theme.of(context).textTheme.bodyText2,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Password",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  icon: Icon(Icons.lock_rounded,
                      color: Theme.of(context).accentColor),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                )),
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
