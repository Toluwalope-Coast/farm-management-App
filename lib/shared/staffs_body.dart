import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/bottom_bar.dart';
import 'package:farm_manager/shared/dialogue_box.dart';
import 'package:farm_manager/shared/insert_screens.dart/staff_insert.dart';
import 'package:farm_manager/shared/report_screens/staff_report.dart';
import 'package:farm_manager/shared/staff_data_card.dart';
import 'package:farm_manager/shared/update_screens.dart/staff_update.dart';
import 'package:flutter/material.dart';

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

  List<Staff> staffList = [];

  // Database codes closes here

  backIconFunction(context) {
    print("Back Icon pressed");
    return navigationPopRoute(context);
  }

  insertIconFunction(context) {
    print("insert Icon pressed");

    navigatePushTo(context, StaffInsert());
  }

  reportIconFunction(context, List<Staff> staff) {
    print("Report Icon pressed");
    return navigatePushTo(context, StaffReport(staff: staff));
  }

  Future modelValueSetter() async {
    try {
      await FirebaseFirestore.instance
          .collection("staff")
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((f) {
          Staff staff = new Staff.withId(
              f.id,
              f.data()['firstname'],
              f.data()['lastname'],
              f.data()['username'],
              f.data()['designation'],
              f.data()['id card no'],
              f.data()['home address'],
              f.data()['email'],
              f.data()['city'],
              f.data()['tel no'],
              f.data()['date of employment']);
          print('Compacted user $staff');
          staffList.add(staff);
        });
      });
      return staffList;
    } catch (e) {
      print('error from the model grabber is $e');
    }
  }

  Future updateItem(
      String index, Size deviceSize, Map<dynamic, dynamic> dbQuery) async {
    print("item at $index has being updated");

    print("staff List at ${dbQuery["firstname"]} has being updated");

    navigatePushTo(context,
        StaffUpdate(deviceSize: deviceSize, index: index, dbQuery: dbQuery));
  }

  deleteItem(String index, BuildContext context, Size deviceSize,
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
                  "Are u sure you want to delete $updateTable $index ?",
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
    Future deleAction(String collectionName, String collectionDoc) async {
      try {
        FirebaseFirestore.instance
            .collection(collectionName)
            .doc(collectionDoc)
            .delete()
            .then((value) {
          print("$collectionName $collectionDoc successfully deleted!");
          navigationPopRoute(context);
        });
      } catch (e) {
        print('The error found is ${e.toString()}');
      }
    }

    modelValueSetter();
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
                child: Container(
                    width: widget.deviceSize.width,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('staff')
                            .orderBy('date of employment', descending: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading........");
                          }

                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onDoubleTap: () => updateItem(
                                      snapshot.data.docs[index].id,
                                      widget.deviceSize,
                                      snapshot.data.docs[index].data()),
                                  onLongPress: () => updateItem(
                                      snapshot.data.docs[index].id,
                                      widget.deviceSize,
                                      snapshot.data.docs[index].data()),
                                  onHorizontalDragEnd:
                                      (DragEndDetails details) {
                                    if (details.primaryVelocity > 0) {
                                      // User swiped Right

                                      print("Staff Swiped Right");
                                      deleteItem(
                                          snapshot.data.docs[index].id,
                                          context,
                                          widget.deviceSize,
                                          "Staffs",
                                          () => deleAction('staff',
                                              snapshot.data.docs[index].id));
                                    } else if (details.primaryVelocity < 0) {
                                      // User swiped Left
                                      print("Staff Swiped Left");
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16.0),
                                    child: StaffDataCard(
                                        staffIDData:
                                            snapshot.data.docs[index].id,
                                        firstnameData: snapshot.data.docs[index]
                                            ['firstname'],
                                        lastnameData: snapshot.data.docs[index]
                                            ['lastname'],
                                        usernameData: snapshot.data.docs[index]
                                            ['username'],
                                        designationData: snapshot
                                            .data.docs[index]['designation'],
                                        idCardNoData: snapshot.data.docs[index]
                                            ['id card no'],
                                        emailData: snapshot.data.docs[index]
                                            ['email'],
                                        addressData: snapshot.data.docs[index]
                                            ['home address'],
                                        cityData: snapshot.data.docs[index]
                                            ['city'],
                                        telNoData: snapshot.data.docs[index]
                                            ['tel no'],
                                        dateData: snapshot.data.docs[index]
                                            ['date of employment']),
                                  ),
                                );
                              });
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
                            reportIconFunction(context, staffList),
                      )))
            ],
          ),
        ));
  }
}
