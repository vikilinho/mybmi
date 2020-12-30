import 'package:flutter/material.dart';
import 'bmipage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      ),
      home: BMIPage(),
    );
  }
}
