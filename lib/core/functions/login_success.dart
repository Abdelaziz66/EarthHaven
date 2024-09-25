import 'package:go_router/go_router.dart';
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';
import 'hive_function.dart';

void loginSuccess(LoginSuccessState state, context) async {
  save('isLogin', true, kStartBox);
  save('uId', LoginSuccessState.loginEntity?.uid, kStartBox);
  isLogin = true;
  saveUserLoginHive(LoginSuccessState.loginEntity!,kUserBox);
  loginEntity = LoginSuccessState.loginEntity;
  uId = LoginSuccessState.loginEntity?.uid;
  GoRouter.of(context).go(AppRouter.kLayout);
}


