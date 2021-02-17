import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class CustomerUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final String index;
  final Map<dynamic, dynamic> dbQuery;

  CustomerUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.index,
    this.dbQuery,
  }) : super(key: key);

  @override
  _CustomerUpdateBodyState createState() => _CustomerUpdateBodyState();
}

class _CustomerUpdateBodyState extends State<CustomerUpdateBody> {
  // Database integration into the code

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController nameController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController addressController = new TextEditingController();

  TextEditingController telNoController = new TextEditingController();

  String _modeOfTransactionSelected;

  List<String> modeOfTransactionSelected = [
    "Cash",
    "Bank Transfer",
    "Cheque",
  ];

  Future updateCustomer(
      context, String index, Map<dynamic, dynamic> dbQuery) async {
    print("name is ${nameController.text}");
    print("email is ${emailController.text}");
    print("address is ${addressController.text}");
    print("TelNo is ${telNoController.text}");
    print("TelNo is $_modeOfTransactionSelected");

    try {
      FirebaseFirestore.instance.collection("customer").doc(index).update({
        "name": nameController.text,
        "address": addressController.text,
        "mode of transaction": _modeOfTransactionSelected,
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
    if (this.nameController.text.isEmpty) {
      this.nameController.text = widget.dbQuery['name'];
    }
    if (this.emailController.text.isEmpty) {
      this.emailController.text = widget.dbQuery['email'];
    }
    if (this.addressController.text.isEmpty) {
      this.addressController.text = widget.dbQuery['address'];
    }
    if (this.telNoController.text.isEmpty) {
      this.telNoController.text = widget.dbQuery['tel no'];
    }
    if (_modeOfTransactionSelected == null) {
      _modeOfTransactionSelected = widget.dbQuery['mode of transaction'];
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
                          "assets/images/customers.jpg",
                          semanticLabel: "Customer background image",
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
                  "Update Customer \n${widget.index}",
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
                            textInputValue: nameController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: this.nameController.text == null
                                ? widget.dbQuery['name']
                                : nameController.text,
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
                            inputIcon: Icon(Icons.mail,
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
                                ? widget.dbQuery['address']
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
                            textInputValue: telNoController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.phone,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: this.telNoController.text == null
                                ? widget.dbQuery['tel no']
                                : telNoController.text,
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
                                  "Select Customer Transaction Mode",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                items: modeOfTransactionSelected
                                    .map((dynamic dropdownItem) =>
                                        DropdownMenuItem<dynamic>(
                                            value: dropdownItem,
                                            child: Text(dropdownItem,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1)))
                                    .toList(),
                                value: _modeOfTransactionSelected == null
                                    ? widget.dbQuery['mode of transaction']
                                    : _modeOfTransactionSelected,
                                onChanged: (dynamic selectedDropdownItem) {
                                  setState(() {
                                    this._modeOfTransactionSelected =
                                        selectedDropdownItem;
                                    print(
                                        'This is the selected value ${this._modeOfTransactionSelected}');
                                  });
                                  print(selectedDropdownItem);
                                })),
                        SizedBox(
                          height: 30.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update Customer",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () => updateCustomer(
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
