import 'package:farm_manager/models/expenses_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class ExpensesUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final Expenses expenses;

  ExpensesUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.expenses,
  }) : super(key: key);

  @override
  _ExpensesUpdateBodyState createState() => _ExpensesUpdateBodyState();
}

class _ExpensesUpdateBodyState extends State<ExpensesUpdateBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController productTypeController = new TextEditingController();

  TextEditingController wayBillNoController = new TextEditingController();

  TextEditingController customerIDController = new TextEditingController();

  TextEditingController quantityRecievedController =
      new TextEditingController();

  TextEditingController amountController = new TextEditingController();

  TextEditingController rateController = new TextEditingController();

  String _paymentModeSelected;
  String _unitSelected;

  List<String> paymentMode = [
    "Cash",
    "Bank Transfer",
    "Cheque",
  ];

  List<String> unit = [
    "NGN",
    "USD",
  ];

  updateExpenses(context) async {
    Expenses expenses = new Expenses.withId(
        widget.expenses.id,
        productTypeController.text,
        wayBillNoController.text,
        customerIDController.text,
        _paymentModeSelected,
        double.parse(quantityRecievedController.text),
        _unitSelected,
        double.parse(rateController.text),
        double.parse(amountController.text),
        '');
    print("firstname is ${productTypeController.text}");
    print("Waybill is ${wayBillNoController.text}");
    print("address is ${customerIDController.text}");
    print("Payment Mode is $_paymentModeSelected");
    print("qty Recieved is ${quantityRecievedController.text}");
    print("Unit is $_unitSelected");
    print("Rate is ${rateController.text}");
    print("Rate is ${amountController.text}");

    int result = await databaseHelper.updateExpenses(expenses);
    if (result != 0) {
      return navigationPopRoute(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.productTypeController.text.isEmpty) {
      this.productTypeController.text = widget.expenses.getProductType;
    }
    if (this.wayBillNoController.text.isEmpty) {
      this.wayBillNoController.text = widget.expenses.getWaybillNo;
    }
    if (this.customerIDController.text.isEmpty) {
      this.customerIDController.text = widget.expenses.getCustomerID.toString();
    }
    if (_paymentModeSelected == null) {
      _paymentModeSelected = widget.expenses.getPaymentMode;
    }
    if (this.quantityRecievedController.text.isEmpty) {
      this.quantityRecievedController.text =
          widget.expenses.getQtyRecieved.toString();
    }
    if (this.rateController.text.isEmpty) {
      this.rateController.text = widget.expenses.getRate.toString();
    }
    if (_unitSelected == null) {
      _unitSelected = widget.expenses.getUnit;
    }
    if (this.amountController.text.isEmpty) {
      this.amountController.text = widget.expenses.getAmountRecieved.toString();
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
                          "assets/images/expenditures.jpg",
                          semanticLabel: "Expenses background image",
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
                  "Update Expenses ${widget.expenses.id}",
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
                            textInputValue: productTypeController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.file_present,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint:
                                "What type of product is the expenses For",
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
                            textInputValue: wayBillNoController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.file_present,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.number,
                            textInputHint: "Enter WayBill Number",
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
                            textInputValue: customerIDController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.text,
                            textInputHint: "Enter Customer ID that bought it",
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
                                  "Select the Payment Mode",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                items: unit
                                    .map((dynamic dropdownItem) =>
                                        DropdownMenuItem<dynamic>(
                                            value: dropdownItem,
                                            child: Text(dropdownItem,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1)))
                                    .toList(),
                                value: _paymentModeSelected,
                                onChanged: (dynamic selectedDropdownItem) {
                                  setState(() {
                                    this._paymentModeSelected =
                                        selectedDropdownItem;
                                    print(
                                        'This is the selected value ${this._paymentModeSelected}');
                                  });
                                  print(selectedDropdownItem);
                                })),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: quantityRecievedController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.linear_scale,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                            textInputHint: "Enter Quantity Recieved",
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
                            textInputValue: rateController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.scatter_plot_outlined,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                            textInputHint: "Enter Rate Per One",
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
                                  "Select the Unit",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                items: unit
                                    .map((dynamic dropdownItem) =>
                                        DropdownMenuItem<dynamic>(
                                            value: dropdownItem,
                                            child: Text(dropdownItem,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1)))
                                    .toList(),
                                value: _unitSelected,
                                onChanged: (dynamic selectedDropdownItem) {
                                  setState(() {
                                    this._unitSelected = selectedDropdownItem;
                                    print(
                                        'This is the selected value ${this._unitSelected}');
                                  });
                                  print(selectedDropdownItem);
                                })),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomRoundedContainer(
                          deviceSize: widget.deviceSize,
                          containerColor:
                              Theme.of(context).secondaryHeaderColor,
                          content: CustomTextfield(
                            textInputValue: amountController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.money,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                            textInputHint: "Enter Amount Spent",
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update Expenses",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () => updateExpenses(context),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
