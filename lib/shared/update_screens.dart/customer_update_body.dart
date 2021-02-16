import 'package:farm_manager/models/customers_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class CustomerUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final Customer customer;

  CustomerUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.customer,
  }) : super(key: key);

  @override
  _CustomerUpdateBodyState createState() => _CustomerUpdateBodyState();
}

class _CustomerUpdateBodyState extends State<CustomerUpdateBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();

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

  updateCustomer(context) async {
    Customer customer = new Customer.withId(
        widget.customer.getId,
        nameController.text,
        emailController.text,
        addressController.text,
        telNoController.text,
        _modeOfTransactionSelected,
        '');
    print("name is ${nameController.text}");
    print("email is ${emailController.text}");
    print("address is ${addressController.text}");
    print("TelNo is ${telNoController.text}");
    print("TelNo is $_modeOfTransactionSelected");

    int result = await databaseHelper.updateCustomer(customer);
    if (result != 0) {
      return navigationPopRoute(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.nameController.text.isEmpty) {
      this.nameController.text = widget.customer.getName;
    }
    if (this.emailController.text.isEmpty) {
      this.emailController.text = widget.customer.getEmail;
    }
    if (this.addressController.text.isEmpty) {
      this.addressController.text = widget.customer.getAddress;
    }
    if (this.telNoController.text.isEmpty) {
      this.telNoController.text = widget.customer.getTelNo;
    }
    if (_modeOfTransactionSelected == null) {
      _modeOfTransactionSelected = widget.customer.getModeOfTransaction;
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
                  "Update Customer ${widget.customer.getId}",
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
                            textInputHint: "Enter new Customer Name",
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
                            textInputHint: "Enter new Customer Email",
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
                            textInputHint: "Enter new Customer Address",
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
                            textInputHint: "Enter new Customer Phone No",
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
                                value: _modeOfTransactionSelected,
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
                          buttonFunction: () => updateCustomer(context),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
