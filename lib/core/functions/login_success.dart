import 'package:go_router/go_router.dart';
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';
import 'custom_snack_bar_message.dart';
import 'hive_function.dart';

void loginSuccess(LoginSuccessState state, context) async {
  showSnackBar(message: 'Login Successful', context: context);
  save('isLogin', true, kStartBox);
  save('uId', LoginSuccessState.loginEntity?.uid, kStartBox);
  isLogin = true;
  saveUserLoginHive(LoginSuccessState.loginEntity!,kUserBox);
  loginEntity = LoginSuccessState.loginEntity;
  uId = LoginSuccessState.loginEntity?.uid;
  GoRouter.of(context).go(AppRouter.kLayout);
}


