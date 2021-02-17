import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class UserUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final String index;
  final Map<dynamic, dynamic> dbQuery;

  UserUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.dbQuery,
    this.index,
  }) : super(key: key);

  @override
  _UserUpdateBodyState createState() => _UserUpdateBodyState();
}

class _UserUpdateBodyState extends State<UserUpdateBody> {
  // Database integration into the code

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController usernameController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  String _designationSelected;

  List<String> designation = [
    "Sales Reps",
    "Store Keeper",
    "Garage Attendant",
    "Field Operator"
  ];

  updateUser(context, String index, Map<dynamic, dynamic> dbQuery) async {
    print("username is ${usernameController.text}");
    print("password is ${passwordController.text}");
    print("Designation Selected is $_designationSelected");
    print("id is $index");

    try {
      FirebaseFirestore.instance.collection("user").doc(index).update({
        "username": usernameController.text,
        "password": passwordController.text,
        "designation": _designationSelected,
      });
      print("Update Successful");
      navigationPopRoute(context);
    } catch (e) {
      print("Update UnSuccessful\n error is $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.usernameController.text.isEmpty) {
      this.usernameController.text = widget.dbQuery["username"];
    }
    if (this.passwordController.text.isEmpty) {
      this.passwordController.text = widget.dbQuery["password"];
    }
    if (_designationSelected == null) {
      _designationSelected = widget.dbQuery["designation"];
    }

    drawerList(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          deviceSize: widget.deviceSize,
          drawerMenuList: drawerList(context),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: widget.deviceSize.height * 0.35,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: "location-img-${widget.heroTag}",
                        child: Image.asset(
                          "assets/images/users.jpg",
                          semanticLabel: "Users background image",
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          height: widget.deviceSize.height * 0.08,
                          width: widget.deviceSize.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_scaffoldKey.currentState.isDrawerOpen) {
                                    _scaffoldKey.currentState.openEndDrawer();
                                  } else {
                                    _scaffoldKey.currentState.openDrawer();
                                  }
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Theme.of(context).primaryColor,
                                  size: 25,
                                ), //your button
                              ),
                              Text(
                                widget.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(fontSize: 22),
                              ),
                              widget.profileImage
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Update User \n ${widget.index}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Divider(
                  height: 16,
                  thickness: 2,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                flex: 2,
                child: Container(
                    width: widget.deviceSize.width,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListView(
                      children: [
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: usernameController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: this.usernameController.text == null
                                ? widget.dbQuery['username']
                                : usernameController.text,
                          ),
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: passwordController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.lock,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.text,
                            textInputHint: this.usernameController.text == null
                                ? widget.dbQuery['password']
                                : usernameController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                            deviceSize: widget.deviceSize,
                            containerColor:
                                Theme.of(context).secondaryHeaderColor,
                            content: DropdownButton<dynamic>(
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text(
                                  this._designationSelected,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                items: designation
                                    .map((dynamic dropdownItem) =>
                                        DropdownMenuItem<dynamic>(
                                            value: dropdownItem,
                                            child: Text(dropdownItem,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1)))
                                    .toList(),
                                value: _designationSelected == null
                                    ? widget.dbQuery['designation']
                                    : _designationSelected,
                                onChanged: (dynamic selectedDropdownItem) {
                                  setState(() {
                                    _designationSelected = selectedDropdownItem;
                                    print(
                                        'This is the selected value ${this._designationSelected}');
                                  });
                                  print(selectedDropdownItem);
                                })),
                        SizedBox(
                          height: 30.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update User",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () =>
                              updateUser(context, widget.index, widget.dbQuery),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
