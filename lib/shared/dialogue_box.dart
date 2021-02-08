import 'package:farm_manager/shared/Constant.dart';
import 'package:farm_manager/shared/rounded_flat_button.dart';
import 'package:flutter/material.dart';

class CustomDialogueBox extends StatelessWidget {
  final Size deviceSize;
  final String deleteTitle;
  final int index;
  final Future<int> delFuncResult;
  CustomDialogueBox({
    Key key,
    @required this.deviceSize,
    this.deleteTitle,
    this.index,
    this.delFuncResult,
  }) : super(key: key);

  yesDelete(context, int itemIndex, Future<int> delFuncResult) {
    delFuncResult.then((value) {
      print('The result value is $value');
      if (value != 0) {
        print("deleted $itemIndex sucessfully");
        return navigationPopRoute(context, true);
      }
      print("Whoopsi!!!! unable deleted $itemIndex");
    });
  }

  noDelete(context) {
    print("mistake");
    return navigationPopRoute(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceSize.height * 0.5,
      width: deviceSize.width * 0.7,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              deleteTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w700),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              height: 8,
              thickness: 2,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: deviceSize.width * 0.3,
                    child: RoundedFlatButton(
                      deviceSize: deviceSize,
                      buttonBackgroundColor: Theme.of(context).primaryColor,
                      buttonTextValue: "Yes",
                      buttonTextStyle: Theme.of(context).textTheme.button,
                      buttonFunction: () =>
                          yesDelete(context, index, delFuncResult),
                    ),
                  ),
                  Container(
                    width: deviceSize.width * 0.3,
                    child: RoundedFlatButton(
                      deviceSize: deviceSize,
                      buttonBackgroundColor: Theme.of(context).indicatorColor,
                      buttonTextValue: "No",
                      buttonTextStyle: Theme.of(context).textTheme.button,
                      buttonFunction: () => noDelete(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //
  }
}
