import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



ThemeData Light_Theme = ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.black,

  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Colors.greenAccent[400],
  //   foregroundColor: Colors.black,
  //
  //   iconSize: 50,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: Colors.greenAccent[400],

    unselectedItemColor: Colors.grey[300],
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
     elevation: 0,

  ),

  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,

    ),
    backgroundColor: Colors.transparent,
    // foregroundColor:  Colors.grey[300],
    iconTheme: IconThemeData(
      color: Colors.grey[300],


    ),
    titleTextStyle: TextStyle(
      color: Colors.grey[300],
      fontSize: 23,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
  ),
);

ThemeData Dark_Theme = ThemeData();