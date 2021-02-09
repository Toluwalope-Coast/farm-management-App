import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/Custom_drawer.dart';
import 'package:farm_manager/shared/custome_cta_cards.dart';
import 'package:flutter/material.dart';

class AnalyticsBody extends StatelessWidget {
  final Size deviceSize;
  final List ctaLists;
  AnalyticsBody({Key key, @required this.deviceSize, this.ctaLists})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    drawerList(context);
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Analytics"),
      drawer: CustomDrawer(
        deviceSize: deviceSize,
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
            constraints: BoxConstraints(maxHeight: deviceSize.height * 0.75),
            child: GridView.count(
              padding: EdgeInsets.only(top: 8.0, bottom: 35.0),
              mainAxisSpacing: 50.0,
              crossAxisSpacing: 35.0,
              crossAxisCount: 2,
              children: List.generate(
                  ctaLists.length,
                  (index) => CustomCTACards(
                        deviceSize: deviceSize,
                        textTitle: ctaLists[index]["Card Title Text"],
                        cardImage: ctaLists[index]["Card Image"],
                        cardFunction: ctaLists[index]["Card Function"],
                        titleSemantic: ctaLists[index]["Card Title Semantic"],
                      )),
            ),
          )
        ],
      ),
    );
  }
}
