import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff0a0e21)),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
