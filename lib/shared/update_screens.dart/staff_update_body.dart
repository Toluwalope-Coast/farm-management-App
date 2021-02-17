import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class StaffUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final String index;
  final Map<dynamic, dynamic> dbQuery;

  StaffUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.index,
    this.dbQuery,
  }) : super(key: key);

  @override
  _StaffUpdateBodyState createState() => _StaffUpdateBodyState();
}

class _StaffUpdateBodyState extends State<StaffUpdateBody> {
  // Database integration into the code

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController lastnameController = new TextEditingController();

  TextEditingController firstnameController = new TextEditingController();

  TextEditingController usernameController = new TextEditingController();

  TextEditingController idCardNoController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController addressController = new TextEditingController();

  TextEditingController cityController = new TextEditingController();

  TextEditingController telNoController = new TextEditingController();

  String _designationSelected;

  List<String> designation = [
    "Sales Reps",
    "Store Keeper",
    "Garage Attendant",
    "Field Operator"
  ];

  Future updateStaff(
      context, String index, Map<dynamic, dynamic> dbQuery) async {
    print("firstname is ${firstnameController.text}");
    print("lastname is ${lastnameController.text}");
    print("username is ${usernameController.text}");
    print("Designation Selected is $_designationSelected");
    print("idCardNo is ${idCardNoController.text}");
    print("email is ${emailController.text}");
    print("address is ${addressController.text}");
    print("city is ${cityController.text}");
    print("Id is ${widget.index}");

    try {
      FirebaseFirestore.instance.collection("staff").doc(index).update({
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "username": usernameController.text,
        "designation": _designationSelected,
        "id card no": idCardNoController.text,
        "home address": addressController.text,
        "city": cityController.text,
        "email": emailController.text,
        "tel no": telNoController.text,
      });
      print("Update Successful");
      navigationPopRoute(context);
    } catch (e) {
      print("Update UnSuccessful\n error is $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.firstnameController.text.isEmpty) {
      this.firstnameController.text = widget.dbQuery['firstname'];
    }
    if (this.lastnameController.text.isEmpty) {
      this.lastnameController.text = widget.dbQuery['lastname'];
    }
    if (this.usernameController.text.isEmpty) {
      this.usernameController.text = widget.dbQuery['username'];
    }
    if (_designationSelected == null) {
      _designationSelected = widget.dbQuery['designation'];
    }
    if (this.idCardNoController.text.isEmpty) {
      this.idCardNoController.text = widget.dbQuery['id card no'];
    }
    if (this.emailController.text.isEmpty) {
      this.emailController.text = widget.dbQuery['email'];
    }
    if (this.addressController.text.isEmpty) {
      this.addressController.text = widget.dbQuery['home address'];
    }
    if (this.cityController.text.isEmpty) {
      this.cityController.text = widget.dbQuery['city'];
    }
    if (this.telNoController.text.isEmpty) {
      this.telNoController.text = widget.dbQuery['tel no'];
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
                          "assets/images/staffs.jpg",
                          semanticLabel: "Staff background image",
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
                  "Update Staff \n ${widget.index}",
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
                            textInputValue: firstnameController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: this.firstnameController.text == null
                                ? widget.dbQuery['firstname']
                                : firstnameController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: lastnameController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: this.lastnameController.text == null
                                ? widget.dbQuery['lastname']
                                : lastnameController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
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
                                  "Select column to Update",
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
                                    this._designationSelected =
                                        selectedDropdownItem;
                                    print(
                                        'This is the selected value ${this._designationSelected}');
                                  });
                                  print(selectedDropdownItem);
                                })),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: idCardNoController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.label_important,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.text,
                            textInputHint: this.idCardNoController.text == null
                                ? widget.dbQuery['id card no']
                                : idCardNoController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: emailController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.email,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.emailAddress,
                            textInputHint: this.emailController.text == null
                                ? widget.dbQuery['email']
                                : emailController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: addressController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.home,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.text,
                            textInputHint: this.addressController.text == null
                                ? widget.dbQuery['home address']
                                : addressController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: cityController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.home,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.text,
                            textInputHint: this.cityController.text == null
                                ? widget.dbQuery['city']
                                : cityController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: telNoController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.phone,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.phone,
                            textInputHint: this.telNoController.text == null
                                ? widget.dbQuery['tel no']
                                : telNoController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update Staff",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () => updateStaff(
                              context, widget.index, widget.dbQuery),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
