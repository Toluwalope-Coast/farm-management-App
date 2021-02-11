import 'package:farm_manager/models/users_models.dart';
import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/custome_cta_cards.dart';
import 'package:farm_manager/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ReportsBody extends StatefulWidget {
  final Size deviceSize;
  final List ctaLists;
  ReportsBody({Key key, @required this.deviceSize, this.ctaLists})
      : super(key: key);

  @override
  _ReportsBodyState createState() => _ReportsBodyState();
}

class _ReportsBodyState extends State<ReportsBody> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<User> usersList;

  updateUsersListReport() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<User>> userListFuture = databaseHelper.getUserList();
      userListFuture.then((userList) {
        if (userList == null) {
          this.usersList = userList;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    drawerList(context);
    updateUsersListReport();
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Reports"),
      drawer: CustomDrawer(
        deviceSize: widget.deviceSize,
        drawerMenuList: drawerList(context),
      ),
      body: ListView(
        padding:
            EdgeInsets.only(top: 2.0, right: 16.0, left: 16.0, bottom: 8.0),
        children: [
          SizedBox(
            height: 20.0,
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: widget.deviceSize.height * 0.75),
            child: GridView.count(
              padding: EdgeInsets.only(top: 8.0, bottom: 35.0),
              mainAxisSpacing: 50.0,
              crossAxisSpacing: 35.0,
              crossAxisCount: 2,
              children: List.generate(
                  widget.ctaLists.length,
                  (index) => CustomCTACards(
                        deviceSize: widget.deviceSize,
                        textTitle: widget.ctaLists[index]["Card Title Text"],
                        cardImage: widget.ctaLists[index]["Card Image"],
                        cardFunction: widget.ctaLists[index]["Card Function"],
                        titleSemantic: widget.ctaLists[index]
                            ["Card Title Semantic"],
                      )),
            ),
          )
        ],
      ),
    );
  }
}
