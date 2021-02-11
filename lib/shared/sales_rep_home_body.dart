import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/custome_cta_cards.dart';
import 'package:flutter/material.dart';
import 'package:farm_manager/shared/custom_drawer.dart';

class SalesRepHomeBody extends StatelessWidget {
  final Size deviceSize;
  final List ctaLists;
  SalesRepHomeBody({Key key, @required this.deviceSize, this.ctaLists})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: customerAppBar("Home"),
      drawer: CustomDrawer(
        deviceSize: deviceSize,
        drawerMenuList: salesRepDrawerList(context),
      ),
      body: ListView(
        padding:
            EdgeInsets.only(top: 2.0, right: 16.0, left: 16.0, bottom: 8.0),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: deviceSize.height * 0.85),
            child: GridView.count(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
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
