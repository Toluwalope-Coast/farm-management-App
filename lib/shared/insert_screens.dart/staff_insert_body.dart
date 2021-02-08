import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class StaffInsertBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;

  StaffInsertBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
  }) : super(key: key);

  @override
  _StaffInsertBodyState createState() => _StaffInsertBodyState();
}

class _StaffInsertBodyState extends State<StaffInsertBody> {
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
    try {
      Staff staff = new Staff(
          firstnameController.text,
          lastnameController.text,
          usernameController.text,
          _designationSelected,
          idCardNoController.text,
          emailController.text,
          addressController.text,
          cityController.text,
          telNoController.text);
      print("firstname is ${firstnameController.text}");
      print("lastname is ${lastnameController.text}");
      print("username is ${usernameController.text}");
      print("Designation Selected is $_designationSelected");
      print("idCardNo is ${idCardNoController.text}");
      print("email is ${emailController.text}");
      print("address is ${addressController.text}");
      print("city is ${cityController.text}");
      print("TelNo is ${telNoController.text}");

      int result = await databaseHelper.insertStaff(staff);
      if (result != 0) {
        return navigationPopRoute(context, true);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    drawerList(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          deviceSize: widget.deviceSize,
          drawerMenuList: drawerList(context),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                EdgeInsets.only(top: 30.0, right: 5.0, bottom: 16.0, left: 5.0),
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
                                    if (_scaffoldKey
                                        .currentState.isDrawerOpen) {
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
                    "Insert New Staff",
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
                      child: Column(
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
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
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
                            buttonBackgroundColor:
                                Theme.of(context).accentColor,
                            buttonTextValue: "Insert Staff",
                            buttonTextStyle: Theme.of(context).textTheme.button,
                            buttonFunction: () => insertStaff(context),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
