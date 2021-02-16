import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/incomes_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/bottom_bar.dart';
import 'package:farm_manager/shared/dialogue_box.dart';
import 'package:farm_manager/shared/incomes_data_card.dart';
import 'package:farm_manager/shared/insert_screens.dart/incomes_insert.dart';
import 'package:farm_manager/shared/report_screens/incomes_report.dart';
import 'package:farm_manager/shared/update_screens.dart/incomes_update.dart';
import 'package:flutter/material.dart';

class IncomesBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final List dataLists;
  IncomesBody(
      {Key key,
      @required this.deviceSize,
      this.profileImage,
      this.title,
      this.heroTag,
      this.dataLists})
      : super(key: key);

  @override
  _IncomesBodyState createState() => _IncomesBodyState();
}

class _IncomesBodyState extends State<IncomesBody> {
  // Database integration into the code

  List<Income> incomeList;

  backIconFunction(context) {
    print("Back Icon pressed");
    return navigationPopRoute(context, null);
  }

  insertIconFunction(context) {
    print("Report Icon pressed");
    return navigatePushTo(context, IncomesInsert());
  }

  reportIconFunction(context, List<Income> income) {
    print("Report Icon pressed");
    return navigatePushTo(context, IncomesReport(incomes: income));
  }

  updateItem(int index, Size deviceSize, Income incomes) {
    print("item at $index has being updated");

    Future<dynamic> result = navigatePushTo(
        context,
        IncomesUpdate(
          deviceSize: deviceSize,
          income: incomes,
        ));
    result.then((value) {
      if (value) {
        return;
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
                          "assets/images/incomes.jpg",
                          semanticLabel: "Incomes background image",
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
                            .collection('income')
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
                                  //     widget.deviceSize, incomeList[index]),
                                  // onLongPress: () => updateItem(index,
                                  //     widget.deviceSize, incomeList[index]),
                                  onHorizontalDragEnd:
                                      (DragEndDetails details) {
                                    if (details.primaryVelocity > 0) {
                                      // User swiped Right

                                      print("Incomes Swiped Right");
                                      deleteItem(
                                          snapshot.data.docs[index].id,
                                          context,
                                          widget.deviceSize,
                                          "Incomes",
                                          () => deleAction('income',
                                              snapshot.data.docs[index].id));
                                    } else if (details.primaryVelocity < 0) {
                                      // User swiped Left
                                      print("Income Swiped Left");
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(bottom: 16.0),
                                      child: IncomesDataCard(
                                        incomeIDData:
                                            snapshot.data.docs[index].id,
                                        productTypeData: snapshot
                                            .data.docs[index]['product type'],
                                        wayBillNoData: snapshot.data.docs[index]
                                            ['waybill no'],
                                        customerIDData: snapshot
                                            .data.docs[index]['customer id'],
                                        paymentModeData: snapshot
                                            .data.docs[index]['payment mode'],
                                        incomeUnitData:
                                            snapshot.data.docs[index]['unit'],
                                        quantitySoldData: snapshot
                                            .data.docs[index]['qty sold'],
                                        incomeRateData:
                                            snapshot.data.docs[index]['rate'],
                                        incomeAmountData: snapshot
                                            .data.docs[index]['amount sold'],
                                        incomeDateData: snapshot
                                            .data.docs[index]['date recorded'],
                                      )),
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
                            reportIconFunction(context, incomeList),
                      )))
            ],
          ),
        ));
  }
}
