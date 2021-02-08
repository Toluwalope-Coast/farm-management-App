import 'package:flutter/material.dart';

class CustomCTACards extends StatelessWidget {
  final Size deviceSize;
  final String textTitle;
  final String titleSemantic;
  final String cardImage;
  final Function cardFunction;
  CustomCTACards(
      {Key key,
      @required this.deviceSize,
      this.textTitle,
      this.cardImage,
      this.cardFunction,
      this.titleSemantic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardFunction,
      child: Hero(
        tag: "location-img-$cardImage",
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor,
                  offset: Offset(5.0, 10.0), //(x,y)
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                ),
                BoxShadow(
                  color: Colors.purpleAccent.shade100,
                  offset: Offset(5.0, 10.0), //(x,y)
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                )
              ],
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          height: deviceSize.height * 0.3,
          width: 40.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Image.asset(
                    cardImage,
                    semanticLabel: titleSemantic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                textTitle,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
