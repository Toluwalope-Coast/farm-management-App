import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/customers_model.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/bottom_bar.dart';
import 'package:farm_manager/shared/customer_data_card.dart';
import 'package:farm_manager/shared/dialogue_box.dart';
import 'package:farm_manager/shared/insert_screens.dart/customers_insert.dart';
import 'package:farm_manager/shared/report_screens/customer_report.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';

class CustomersBody extends StatefulWidget {
  final Size deviceSize;
  final Widget profileImage;
  final String heroTag;
  final String title;
  final List dataLists;
  CustomersBody(
      {Key key,
      @required this.deviceSize,
      this.profileImage,
      this.title,
      this.heroTag,
      this.dataLists})
      : super(key: key);

  @override
  _CustomersBodyState createState() => _CustomersBodyState();
}

class _CustomersBodyState extends State<CustomersBody> {
  // Database integration into the code

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Customer> customerList;

  backIconFunction(context) {
    print("Back Icon pressed");
    return navigationPopRoute(context, null);
  }

  insertIconFunction(context) {
    print("insert Icon pressed");

    navigatePushTo(context, CustomerInsert());
  }

  reportIconFunction(context, List<Customer> customer) {
    print("Report Icon pressed");
    return navigatePushTo(context, CustomerReport(customer: customer));
  }

  // updateItem(int index, Size deviceSize, Customer customer) {
  //   print("item at $index has being updated");

  //   Future<dynamic> result = navigatePushTo(
  //       context,
  //       CustomerUpdate(
  //         deviceSize: deviceSize,
  //         customer: customer,
  //       ));
  //   result.then((value) {
  //     if (value) {
  //       return updateListView();
  //     } else {
  //       return;
  //     }
  //   });
  // }

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

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future<int> deleAction(Customer tableRow) async {
      return null;
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
                          "assets/images/customers.jpg",
                          semanticLabel: "Customer background image",
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
                            .collection('customer')
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
                                  //     widget.deviceSize, customerList[index]),
                                  // onLongPress: () => updateItem(index,
                                  //     widget.deviceSize, customerList[index]),
                                  // onHorizontalDragEnd: (DragEndDetails details) {
                                  //   if (details.primaryVelocity > 0) {
                                  //     // User swiped Right

                                  //     print("Customer Swiped Right");
                                  //     deleteItem(
                                  //         index,
                                  //         context,
                                  //         widget.deviceSize,
                                  //         "Customer",
                                  //         () => deleAction(customerList[index]));
                                  //   } else if (details.primaryVelocity < 0) {
                                  //     // User swiped Left
                                  //     print("Customer Swiped Left");
                                  //   }
                                  // },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16.0),
                                    child: CustomerDataCard(
                                        customerIDData:
                                            snapshot.data.docs[index].id,
                                        customerNameData:
                                            snapshot.data.docs[index]['name'],
                                        emailData: snapshot.data.docs[index]
                                            ['email'],
                                        addressData: snapshot.data.docs[index]
                                            ['address'],
                                        customerPaymentModeData: snapshot.data
                                            .docs[index]['mode of transaction'],
                                        telNoData: snapshot.data.docs[index]
                                            ['tel no'],
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
                            reportIconFunction(context, customerList),
                      )))
            ],
          ),
        ));
  }
}
