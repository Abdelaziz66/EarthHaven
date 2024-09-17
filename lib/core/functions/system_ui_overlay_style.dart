import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void systemStatesNavigationBar(){
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,

  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarDividerColor: Colors.black,

  ));
}
