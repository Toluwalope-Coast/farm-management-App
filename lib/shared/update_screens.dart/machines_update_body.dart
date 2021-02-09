import 'package:farm_manager/models/machineries_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custom_drawer.dart';
import 'package:farm_manager/shared/custom_textfield.dart';
import 'package:farm_manager/shared/rounded_container.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class MachinesUpdateBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final Machinery machinery;

  MachinesUpdateBody({
    Key key,
    @required this.deviceSize,
    this.profileImage,
    this.title,
    this.heroTag,
    this.machinery,
  }) : super(key: key);

  @override
  _MachinesUpdateBodyState createState() => _MachinesUpdateBodyState();
}

class _MachinesUpdateBodyState extends State<MachinesUpdateBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController machinesTypeController = new TextEditingController();

  TextEditingController idCardNoController = new TextEditingController();

  insertMachines(context) async {
    Machinery machine =
        new Machinery(machinesTypeController.text, idCardNoController.text);
    print("Machine Type is ${machinesTypeController.text}");
    print("Id Card No is ${idCardNoController.text}");

    int result = await databaseHelper.insertMachines(machine);
    if (result != 0) {
      return navigationPopRoute(context, true);
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
                          "assets/images/machines2.jpg",
                          semanticLabel: "Machines background image",
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
                  "Insert New Machines",
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
                            textInputValue: machinesTypeController,
                            deviceSize: widget.deviceSize,
                            inputIcon: Icon(Icons.traffic,
                                color: Theme.of(context).accentColor),
                            obscureText: false,
                            textInputHintStyle:
                                Theme.of(context).textTheme.bodyText2,
                            inputType: TextInputType.name,
                            textInputHint: "Type Of Machine",
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
                          height: 30.0,
                        ),
                        RoundedFlatButton(
                          deviceSize: widget.deviceSize,
                          buttonBackgroundColor: Theme.of(context).accentColor,
                          buttonTextValue: "Insert Machine",
                          buttonTextStyle: Theme.of(context).textTheme.button,
                          buttonFunction: () => insertMachines(context),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
