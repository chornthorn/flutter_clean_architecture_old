import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: 'Kanit-Regular',
      ),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(fontSize: 16),
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(fontSize: 14),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14),
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        body1: TextStyle(fontSize: 14, fontFamily: 'Kanit-Regular'),
      ),
    ),
    fontFamily: 'Kanit-Regular',
  );
}
