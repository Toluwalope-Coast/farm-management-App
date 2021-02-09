import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/bottom_bar.dart';
import 'package:farm_manager/shared/dialogue_box.dart';
import 'package:farm_manager/shared/insert_screens.dart/staff_insert.dart';
import 'package:farm_manager/shared/report_screens/staff_report.dart';
import 'package:farm_manager/shared/staff_data_card.dart';
import 'package:farm_manager/shared/update_screens.dart/staff_update.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class StaffsBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final List dataLists;
  StaffsBody(
      {Key key,
      @required this.deviceSize,
      this.profileImage,
      this.title,
      this.heroTag,
      this.dataLists})
      : super(key: key);

  @override
  _StaffsBodyState createState() => _StaffsBodyState();
}

class _StaffsBodyState extends State<StaffsBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Staff> staffList;

  updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Staff>> staffListFuture = databaseHelper.getStaffList();
      staffListFuture.then((staffList) {
        if (staffList != null) {
          setState(() {
            this.staffList = staffList;
          });
        }
      });
    });
  }
  // Database codes closes here

  backIconFunction(context) {
    print("Back Icon pressed");
    return navigationPopRoute(context, null);
  }

  insertIconFunction(context) {
    print("insert Icon pressed");

    Future result = navigatePushTo(context, StaffInsert());
    result.then((value) {
      if (value) {
        updateListView();
      }
    });
  }

  reportIconFunction(context) {
    print("Report Icon pressed");
    return navigatePushTo(context, StaffReport());
  }

  updateItem(int index, Size deviceSize, Staff staff) {
    print("item at $index has being updated");

    Future<dynamic> result = navigatePushTo(
        context,
        StaffUpdate(
          deviceSize: deviceSize,
          staff: staff,
        ));
    result.then((value) {
      if (value) {
        return updateListView();
      } else {
        return;
      }
    });
  }

  deleteItem(int index, BuildContext context, Size deviceSize,
      String updateTable, AsyncCallback delFunc) {
    print("delete dialogue called on $index index item");
    print("item at $index has being updated");
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: deviceSize.height * 0.6,
            child: SizedBox.expand(
                child: CustomDialogueBox(
              deviceSize: deviceSize,
              deleteTitle:
                  "Are u sure you want to delete $updateTable ${index + 1} ?",
              index: index,
              delFuncResult: delFunc,
            )),
            margin: EdgeInsets.only(bottom: 50, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  List<String> columns = [
    "username",
    "password",
    "designation",
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (staffList == null) {
      staffList = <Staff>[];
      updateListView();
    }

    Future<int> deleAction(Staff tableRow) async {
      int result = await databaseHelper.deleteStaff(tableRow.getId);
      updateListView();
      return result;
    }

    drawerList(context);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white10,
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
              Expanded(
                flex: 2,
                child: staffList.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        color: Theme.of(context).backgroundColor,
                        child: Center(
                            child: RichText(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(text: "No Entry has been made for"),
                                TextSpan(
                                    text: "\n ${widget.title}\n\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFFAE00),
                                        )),
                                TextSpan(text: "\nClick the "),
                                TextSpan(
                                    text: "insert button ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFFAE00),
                                        )),
                                TextSpan(
                                  text: "below to make an entry",
                                )
                              ]),
                        )),
                      )
                    : Container(
                        width: widget.deviceSize.width,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: ListView.builder(
                            itemCount: staffList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onDoubleTap: () => updateItem(
                                    index, widget.deviceSize, staffList[index]),
                                onLongPress: () => updateItem(
                                    index, widget.deviceSize, staffList[index]),
                                onHorizontalDragEnd: (DragEndDetails details) {
                                  if (details.primaryVelocity > 0) {
                                    // User swiped Right

                                    print("Staff Swiped Right");
                                    deleteItem(
                                        index,
                                        context,
                                        widget.deviceSize,
                                        "Staffs",
                                        () => deleAction(staffList[index]));
                                  } else if (details.primaryVelocity < 0) {
                                    // User swiped Left
                                    print("Staff Swiped Left");
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16.0),
                                  child: StaffDataCard(
                                      designationData:
                                          staffList[index].getDesignation,
                                      staffIDData: staffList[index].getId,
                                      usernameData:
                                          staffList[index].getUsername,
                                      firstnameData:
                                          staffList[index].getFirstname,
                                      lastnameData:
                                          staffList[index].getLastname,
                                      idCardNoData:
                                          staffList[index].getIdCardNo,
                                      emailData: staffList[index].getEmail,
                                      addressData:
                                          staffList[index].getHomeAddress,
                                      cityData: staffList[index].getCity,
                                      telNoData: staffList[index].getTelNo,
                                      deleteFunction: () => deleteItem(
                                          index,
                                          context,
                                          widget.deviceSize,
                                          "Staff",
                                          () => deleAction(staffList[index]))),
                                ),
                              );
                            })),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: widget.deviceSize.height * 0.16,
                      width: widget.deviceSize.width,
                      child: BottomBar(
                        deviceSize: widget.deviceSize,
                        iconBackIconFunction: () => backIconFunction(context),
                        iconInsertIconFunction: () =>
                            insertIconFunction(context),
                        iconReportIconFunction: () =>
                            reportIconFunction(context),
                      )))
            ],
          ),
        ));
  }
}
