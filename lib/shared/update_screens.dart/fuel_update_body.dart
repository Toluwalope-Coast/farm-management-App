import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class FuelUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final String index;
  final Map<dynamic, dynamic> dbQuery;

  FuelUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.index,
    this.dbQuery,
  }) : super(key: key);

  @override
  _FuelUpdateBodyState createState() => _FuelUpdateBodyState();
}

class _FuelUpdateBodyState extends State<FuelUpdateBody> {
  // Database integration into the code

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController fuelTypeController = new TextEditingController();

  TextEditingController machineIDController = new TextEditingController();

  TextEditingController idCardNoController = new TextEditingController();

  Future updateFuel(
      context, String index, Map<dynamic, dynamic> dbQuery) async {
    print("Fuel Type is ${fuelTypeController.text}");
    print("Id Card No is ${idCardNoController.text}");
    print("Machine Type is ${machineIDController.text}");

    try {
      FirebaseFirestore.instance.collection("fuel").doc(index).update({
        "type": fuelTypeController.text,
        "id card no": idCardNoController.text,
        "machine id": machineIDController.text,
      });
      print("Update Successful");
      navigationPopRoute(context);
    } catch (e) {
      print("Update UnSuccessful\n error is $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.fuelTypeController.text.isEmpty) {
      this.fuelTypeController.text = widget.dbQuery['type'];
    }
    if (this.idCardNoController.text.isEmpty) {
      this.idCardNoController.text = widget.dbQuery['id card no'];
    }
    if (this.machineIDController.text.isEmpty) {
      this.machineIDController.text = widget.dbQuery['machine id'];
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
                          "assets/images/fuel.jpg",
                          semanticLabel: "Fuel background image",
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
                  "Update Fuel \n${widget.index}",
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
                            textInputValue: fuelTypeController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.file_present,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: this.fuelTypeController.text == null
                                ? widget.dbQuery['type']
                                : fuelTypeController.text,
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
                            textInputValue: machineIDController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.transfer_within_a_station,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.text,
                            textInputHint: this.machineIDController.text == null
                                ? widget.dbQuery['machine id']
                                : machineIDController.text,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Update Fuel",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () =>
                              updateFuel(context, widget.index, widget.dbQuery),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
