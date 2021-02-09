import 'package:farm_manager/models/planting_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class PlantingUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final Planting planting;

  PlantingUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.planting,
  }) : super(key: key);

  @override
  _PlantingUpdateBodyState createState() => _PlantingUpdateBodyState();
}

class _PlantingUpdateBodyState extends State<PlantingUpdateBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController plantingTypeController = new TextEditingController();

  TextEditingController qtyController = new TextEditingController();

  TextEditingController seedIDController = new TextEditingController();

  TextEditingController acreageController = new TextEditingController();

  TextEditingController machineIDController = new TextEditingController();

  TextEditingController idCardNoController = new TextEditingController();

  String _unitSelected;

  List<String> unit = [
    "bag",
    "pcs",
  ];

  updatePlanting(context) async {
    Planting planting = new Planting.withId(
        widget.planting.getId,
        plantingTypeController.text,
        idCardNoController.text,
        double.parse(qtyController.text),
        double.parse(acreageController.text),
        _unitSelected,
        int.parse(machineIDController.text),
        int.parse(seedIDController.text),
        '');
    print("Planting Type is ${plantingTypeController.text}");
    print("Id Card No is ${idCardNoController.text}");
    print("Quantity is ${qtyController.text}");
    print("Acreage Type is ${acreageController.text}");
    print("Selected Unit is $_unitSelected");
    print("Machine Type is ${machineIDController.text}");
    print("Acreage Type is ${acreageController.text}");

    int result = await databaseHelper.updatePlanting(planting);
    if (result != 0) {
      return navigationPopRoute(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.plantingTypeController.text.isEmpty) {
      this.plantingTypeController.text = widget.planting.getType;
    }
    if (this.idCardNoController.text.isEmpty) {
      this.idCardNoController.text = widget.planting.getIdCardNo;
    }
    if (this.acreageController.text.isEmpty) {
      this.acreageController.text = widget.planting.getAcreage.toString();
    }
    if (_unitSelected == null) {
      _unitSelected = widget.planting.getUnit;
    }
    if (this.qtyController.text.isEmpty) {
      this.qtyController.text = widget.planting.getQty.toString();
    }
    if (this.machineIDController.text.isEmpty) {
      this.machineIDController.text = widget.planting.getMachineId.toString();
    }
    if (this.seedIDController.text.isEmpty) {
      this.seedIDController.text = widget.planting.getSeedId.toString();
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
                          "assets/images/Planting.jpg",
                          semanticLabel: "Planting background image",
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
                  "Update Planting",
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
                            textInputValue: plantingTypeController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.file_present,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: "Type Plant",
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
                            textInputValue: idCardNoController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.number,
                            textInputHint: "Enter Staff Id Card No",
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
                            textInputValue: acreageController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.traffic,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                            textInputHint: "Enter the Acreage Covered",
                          ),
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
                            textInputValue: qtyController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.format_list_numbered,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            textInputHint: "Enter Quantity Planted",
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
                            textInputValue: machineIDController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.transfer_within_a_station,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.number,
                            textInputHint: "Enter Machine ID",
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
                            textInputValue: seedIDController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.transfer_within_a_station,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.number,
                            textInputHint: "Enter Seed ID",
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update Planting",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () => updatePlanting(context),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
