import 'package:hive_flutter/adapters.dart';
import '../../features/login/domain/entities/login_entity.dart';
import '../constants/constant.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LoginEntityAdapter());

  await Hive.openBox(kStartBox);
  await Hive.openBox<LoginEntity>(kUserBox);

  var startBoxData = Hive.box(kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;
  isLogin = startBoxData.get('isLogin') ?? false;
  uId = startBoxData.get('uId');
  var box = Hive.box<LoginEntity>(kUserBox);
  loginEntity=box.get('loginEntity');



}