import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class ExpensesUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final String index;
  final Map<dynamic, dynamic> dbQuery;

  ExpensesUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.index,
    this.dbQuery,
  }) : super(key: key);

  @override
  _ExpensesUpdateBodyState createState() => _ExpensesUpdateBodyState();
}

class _ExpensesUpdateBodyState extends State<ExpensesUpdateBody> {
  // Database integration into the code

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

  Future updateExpenses(
      context, String index, Map<dynamic, dynamic> dbQuery) async {
    print("firstname is ${productTypeController.text}");
    print("Waybill is ${wayBillNoController.text}");
    print("address is ${customerIDController.text}");
    print("Payment Mode is $_paymentModeSelected");
    print("qty Recieved is ${quantityRecievedController.text}");
    print("Unit is $_unitSelected");
    print("Rate is ${rateController.text}");
    print("Rate is ${amountController.text}");

    try {
      FirebaseFirestore.instance.collection("expense").doc(index).update({
        "product type": productTypeController.text,
        "waybill no": wayBillNoController.text,
        "customer id": customerIDController.text,
        "payment mode": _paymentModeSelected,
        "qty recieved": double.parse(quantityRecievedController.text),
        "unit": _unitSelected,
        "rate": double.parse(rateController.text),
        "amount sold": double.parse(amountController.text),
      });
      print("Update Successful");
      navigationPopRoute(context);
    } catch (e) {
      print("Update UnSuccessful\n error is $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.productTypeController.text.isEmpty) {
      this.productTypeController.text = widget.dbQuery['product type'];
    }
    if (this.wayBillNoController.text.isEmpty) {
      this.wayBillNoController.text = widget.dbQuery['waybill no'];
    }
    if (this.customerIDController.text.isEmpty) {
      this.customerIDController.text = widget.dbQuery['customer id'];
    }
    if (_paymentModeSelected == null) {
      _paymentModeSelected = widget.dbQuery['payment mode'];
    }
    if (this.quantityRecievedController.text.isEmpty) {
      this.quantityRecievedController.text =
          widget.dbQuery['qty recieved'].toString();
    }
    if (this.rateController.text.isEmpty) {
      this.rateController.text = widget.dbQuery['rate'].toString();
    }
    if (_unitSelected == null) {
      _unitSelected = widget.dbQuery['unit'];
    }
    if (this.amountController.text.isEmpty) {
      this.amountController.text = widget.dbQuery['amount sold'].toString();
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
                  "Update Expenses \n${widget.index}",
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
                                this.productTypeController.text == null
                                    ? widget.dbQuery['product type']
                                    : productTypeController.text,
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
                            textInputHint: this.wayBillNoController.text == null
                                ? widget.dbQuery['waybill no']
                                : wayBillNoController.text,
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
                            textInputHint:
                                this.customerIDController.text == null
                                    ? widget.dbQuery['customer id']
                                    : customerIDController.text,
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
                                value: _unitSelected == null
                                    ? widget.dbQuery['unit']
                                    : _unitSelected,
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
                            inputType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            textInputHint:
                                this.quantityRecievedController.text == null
                                    ? widget.dbQuery['qty recieved']
                                    : quantityRecievedController.text,
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
                            inputType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            textInputHint: this.rateController.text == null
                                ? widget.dbQuery['rate']
                                : rateController.text,
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
                            textInputValue: amountController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.money,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            textInputHint: this.amountController.text == null
                                ? widget.dbQuery['amount sold']
                                : amountController.text,
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
                          buttonFunction: () => updateExpenses(
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
