import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData adebolaFarmManagerTheme() {
  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: 'poppins',
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(
          fontFamily: 'poppins',
          fontSize: 20.0,
          color: Color(0xFF6F35A5),
          fontWeight: FontWeight.w500,
        ),
        headline2: base.headline2.copyWith(
            fontFamily: 'poppins', fontSize: 24.0, color: Color(0XAA061536)),
        headline3: base.headline3.copyWith(
            fontFamily: 'poppins', fontSize: 12.0, color: Color(0xffE5306C)),
        headline5: base.headline5.copyWith(
            fontFamily: 'poppins', fontSize: 16.0, color: Colors.white),
        headline4: base.headline4.copyWith(
            fontFamily: 'poppins',
            fontSize: 16.0,
            color: Color(0xFF6F35A5),
            fontWeight: FontWeight.w600),
        subtitle2: base.subtitle2.copyWith(
            fontFamily: 'poppins',
            fontSize: 10.0,
            color: Color(0xFFFFAE00),
            fontWeight: FontWeight.w700),
        subtitle1: base.subtitle1.copyWith(
            fontFamily: 'poppins',
            fontSize: 16.0,
            color: Color(0xFF6F35A5),
            fontWeight: FontWeight.w500),
        button: base.button.copyWith(
            color: Colors.white,
            fontFamily: 'poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        bodyText1: base.bodyText1.copyWith(
            color: Colors.white, fontFamily: 'poppins', fontSize: 12.0),
        caption: base.bodyText1.copyWith(
            color: Color(0xFF6F35A5), fontSize: 12.0, fontFamily: 'poppins'),
        bodyText2: base.bodyText2.copyWith(
            color: Color(0xff454f63), fontFamily: 'poppins', fontSize: 16.0));
  }

  ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: basicTextTheme(base.textTheme),
      primaryColor: Color(0xFF6F35A5),
      secondaryHeaderColor: Color(0x336F35A5),
      iconTheme: IconThemeData(color: Color(0xFF6F35A5), size: 22.0),
      indicatorColor: Color(0xFFBF85F5),
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
      accentColor: Color(0xFF6F35A5),
      buttonTheme: base.buttonTheme.copyWith(buttonColor: Color(0x3300FF7F)),
      buttonColor: Color(0xFF6F35A5),
      backgroundColor: Colors.white,
      appBarTheme: base.appBarTheme.copyWith(
        color: Color(0x336F35A5),
        centerTitle: true,
        elevation: 0.0,
        actionsIconTheme:
            base.iconTheme.copyWith(color: Color(0xFFFFAE00), size: 18.0),
      ));
}
