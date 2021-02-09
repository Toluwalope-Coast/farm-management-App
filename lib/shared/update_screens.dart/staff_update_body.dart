import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class StaffUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final Staff staff;

  StaffUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.staff,
  }) : super(key: key);

  @override
  _StaffUpdateBodyState createState() => _StaffUpdateBodyState();
}

class _StaffUpdateBodyState extends State<StaffUpdateBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();

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

  insertStaff(context) async {
    Staff staff = new Staff.withId(
        widget.staff.getId,
        firstnameController.text,
        lastnameController.text,
        usernameController.text,
        _designationSelected,
        idCardNoController.text,
        emailController.text,
        addressController.text,
        cityController.text,
        telNoController.text,
        '');
    print("firstname is ${firstnameController.text}");
    print("lastname is ${lastnameController.text}");
    print("username is ${usernameController.text}");
    print("Designation Selected is $_designationSelected");
    print("idCardNo is ${idCardNoController.text}");
    print("email is ${emailController.text}");
    print("address is ${addressController.text}");
    print("city is ${cityController.text}");
    print("TelNo is ${telNoController.text}");

    int result = await databaseHelper.updateStaff(staff);
    print('The result: $result');
    if (result != 0) {
      return navigationPopRoute(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.firstnameController.text.isEmpty) {
      this.firstnameController.text = widget.staff.getFirstname;
    }
    if (this.lastnameController.text.isEmpty) {
      this.lastnameController.text = widget.staff.getLastname;
    }
    if (this.usernameController.text.isEmpty) {
      this.usernameController.text = widget.staff.getUsername;
    }
    if (_designationSelected == null) {
      _designationSelected = widget.staff.getDesignation;
    }
    if (this.idCardNoController.text.isEmpty) {
      this.idCardNoController.text = widget.staff.getIdCardNo;
    }
    if (this.emailController.text.isEmpty) {
      this.emailController.text = widget.staff.getEmail;
    }
    if (this.addressController.text.isEmpty) {
      this.addressController.text = widget.staff.getHomeAddress;
    }
    if (this.cityController.text.isEmpty) {
      this.cityController.text = widget.staff.getCity;
    }
    if (this.telNoController.text.isEmpty) {
      this.telNoController.text = widget.staff.getTelNo;
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
                  "Update Staff",
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
                            textInputHint: "Enter new Firstname",
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
                            textInputHint: "Enter new Lastname",
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
                            textInputHint: "Enter new Username",
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
                                value: _designationSelected,
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
                            textInputHint: "Enter new Id Card No",
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
                            textInputHint: "Enter new Email Address",
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
                            textInputHint: "Enter new Staff Home address",
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
                            textInputHint: "Enter new Staff Residing City",
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
                            textInputHint: "Enter new staff phone number",
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Insert Staff",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () => insertStaff(context),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
