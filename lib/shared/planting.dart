import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/planting_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/bottom_bar.dart';
import 'package:farm_manager/shared/dialogue_box.dart';
import 'package:farm_manager/shared/insert_screens.dart/planting_insert.dart';
import 'package:farm_manager/shared/planting_data_card.dart';
import 'package:farm_manager/shared/report_screens/planting_report.dart';
import 'package:farm_manager/shared/update_screens.dart/planting_update.dart';
import 'package:flutter/material.dart';

class PlantingBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final List dataLists;
  PlantingBody(
      {Key key,
      @required this.deviceSize,
      this.profileImage,
      this.title,
      this.heroTag,
      this.dataLists})
      : super(key: key);

  @override
  _PlantingBodyState createState() => _PlantingBodyState();
}

class _PlantingBodyState extends State<PlantingBody> {
  // Database integration into the code

  List<Planting> plantingList;
  // Database codes closes here

  backIconFunction(context) {
    print("Back Icon pressed");
    return navigationPopRoute(context, null);
  }

  insertIconFunction(context) {
    print("Report Icon pressed");
    return navigatePushTo(context, PlantingInsert());
  }

  reportIconFunction(context, List<Planting> planting) {
    print("Report Icon pressed");
    return navigatePushTo(context, PlantingReport(planting: planting));
  }

  updateItem(int index, Size deviceSize, Planting plant) {
    print("item at $index has being updated");

    Future<dynamic> result = navigatePushTo(
        context,
        PlantingUpdate(
          deviceSize: deviceSize,
          planting: plant,
        ));
    result.then((value) {
      if (value) {
        return null;
      } else {
        return;
      }
    });
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

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future deleAction(String collectionName, String collectionDoc) async {
      FirebaseFirestore.instance
          .collection(collectionName)
          .doc(collectionDoc)
          .delete()
          .then((value) =>
              print("$collectionName $collectionDoc successfully deleted!"));
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
              Expanded(
                flex: 2,
                child: Container(
                    width: widget.deviceSize.width,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('planting')
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
                                  // onDoubleTap: () => updateItem(index,
                                  //     widget.deviceSize, plantingList[index]),
                                  // onLongPress: () => updateItem(index,
                                  //     widget.deviceSize, plantingList[index]),
                                  onHorizontalDragEnd:
                                      (DragEndDetails details) {
                                    if (details.primaryVelocity > 0) {
                                      // User swiped Right

                                      print("Planting Swiped Right");
                                      deleteItem(
                                          snapshot.data.docs[index].id,
                                          context,
                                          widget.deviceSize,
                                          "Planting",
                                          () => deleAction('planting',
                                              snapshot.data.docs[index].id));
                                    } else if (details.primaryVelocity < 0) {
                                      // User swiped Left
                                      print("Planting Swiped Left");
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16.0),
                                    child: PlantingDataCard(
                                        plantingIDData:
                                            snapshot.data.docs[index].id,
                                        idCardNoData: snapshot.data.docs[index]
                                            ['id card no'],
                                        machineIDData: snapshot.data.docs[index]
                                            ['machine id'],
                                        seedsIDData: snapshot.data.docs[index]
                                            ['seed id'],
                                        plantingQuantityData:
                                            snapshot.data.docs[index]['qty'],
                                        plantingTypeData:
                                            snapshot.data.docs[index]['type'],
                                        acreageData: snapshot.data.docs[index]
                                            ['acreage done'],
                                        plantingUnitData:
                                            snapshot.data.docs[index]['unit'],
                                        dateData: snapshot.data.docs[index]
                                            ['date recorded']),
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
                            reportIconFunction(context, plantingList),
                      )))
            ],
          ),
        ));
  }
}
