part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginWithGoogleLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  static LoginEntity? loginEntity;

  static set({required LoginEntity loginEntity}) {
    LoginSuccessState.loginEntity = loginEntity;
  }
}
class LoginErrorState extends LoginState {
  final String errMessage;
  LoginErrorState(this.errMessage);
}

class ChangeEyeState extends LoginState {}
