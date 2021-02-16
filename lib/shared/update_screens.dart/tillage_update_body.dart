import 'package:farm_manager/models/tillage_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class TillageUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final Tillage tillage;

  TillageUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.tillage,
  }) : super(key: key);

  @override
  _TillageUpdateBodyState createState() => _TillageUpdateBodyState();
}

class _TillageUpdateBodyState extends State<TillageUpdateBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController tillageTypeController = new TextEditingController();

  TextEditingController acreageController = new TextEditingController();

  TextEditingController machineIDController = new TextEditingController();

  TextEditingController idCardNoController = new TextEditingController();

  updateTillage(context, Tillage model) async {
    Tillage tillageModel = new Tillage.withId(
        model.getId,
        tillageTypeController.text,
        idCardNoController.text,
        machineIDController.text,
        double.parse(acreageController.text));
    print("Tillage Type is ${tillageTypeController.text}");
    print("Id Card No is ${idCardNoController.text}");
    print("Machine Type is ${machineIDController.text}");
    print("Acreage Type is ${acreageController.text}");
    print("Acreage Type is ${acreageController.text}");

    int result = await databaseHelper.updateTillage(tillageModel);
    if (result != 0) {
      return navigationPopRoute(context);
    } else {
      print("Whoopsiiii");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.tillageTypeController.text.isEmpty) {
      this.tillageTypeController.text = widget.tillage.getType;
    }
    if (this.idCardNoController.text.isEmpty) {
      this.idCardNoController.text = widget.tillage.getIdCardNo;
    }
    if (this.acreageController.text.isEmpty) {
      this.acreageController.text = widget.tillage.getAcreage.toString();
    }
    if (this.machineIDController.text.isEmpty) {
      this.machineIDController.text = widget.tillage.getMachineId.toString();
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
                          "assets/images/tillage.jpg",
                          semanticLabel: "Tillage background image",
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
                  "Update Tillage ${widget.tillage.getId}",
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
                            textInputValue: tillageTypeController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.file_present,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: "Type Of Tillage",
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
                            inputType: TextInputType.text,
                            textInputHint: "Enter Machine ID",
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update Tillage",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () =>
                              updateTillage(context, widget.tillage),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
