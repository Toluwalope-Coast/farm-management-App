import 'package:farm_manager/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:farm_manager/shared/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adebola Farm Manager',
      theme: adebolaFarmManagerTheme(),
      home: Login(),
    );
  }
}
