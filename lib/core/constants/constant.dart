import 'package:earth_haven/features/login/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';

const kStartBox = 'start_box';
const kUserBox = 'user_box';

late LoginEntity? loginEntity;
  bool? isOnboarding;
  bool? isLogin;
  String? uId ;

var layoutScaffoldKey=GlobalKey<ScaffoldState>();
var profileScaffoldKey = GlobalKey<ScaffoldState>();
