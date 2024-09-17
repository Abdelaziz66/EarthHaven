import 'package:earth_haven/core/style/colors.dart';
import 'package:flutter/material.dart';


final darkTheme = ThemeData(
    textTheme: const TextTheme(

    ),
    scaffoldBackgroundColor: Colors.black,


    brightness: Brightness.light,
    primaryColor: KColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: KColors.primaryColor,
    ),
    splashColor: Colors.transparent,
    // No splash color
    highlightColor: Colors.transparent,

    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: KColors.primaryColor),
        iconColor: KColors.secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ))
);
