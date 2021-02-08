import 'dart:ui';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Size deviceSize;
  final List drawerMenuList;
  CustomDrawer({Key key, @required this.deviceSize, this.drawerMenuList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(22.0),
            bottomRight: Radius.circular(24.0)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: deviceSize.height * 0.97,
          width: deviceSize.width * 0.75,
          child: Stack(
            children: [
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                      decoration: BoxDecoration(
                    color: Theme.of(context).indicatorColor.withOpacity(0.5),
                  ))),
              Container(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 35.0, left: 4.0, right: 4.0),
                    child: Column(children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image(
                            semanticLabel: "user's profile image",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/profile.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text("Admin Test",
                          style: Theme.of(context).textTheme.headline5),
                      SizedBox(height: 8.0),
                      Divider(
                        height: 1.0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: deviceSize.height * 0.6),
                        child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 8.0),
                            itemBuilder: (context, int index) => ListTile(
                                  leading: drawerMenuList[index]["Menu Icon"],
                                  title: drawerMenuList[index]["Menu Name"],
                                  onTap: drawerMenuList[index]["Menu Nav"],
                                ),
                            separatorBuilder: (context, int index) => Divider(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                            itemCount: drawerMenuList.length),
                      ),
                      Divider(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ])),
              )
            ],
          ),
        ));
  }
}
