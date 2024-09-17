
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';
import 'hive_function.dart';

void logout(context) {
  isLogin = false;
  uId = null;
  loginEntity=null;
  save('isLogin', false, kStartBox);
  save('uId', null, kStartBox);
  LoginSuccessState.loginEntity = null;
  GoRouter.of(context).go(AppRouter.kLoginOrRegister);
}