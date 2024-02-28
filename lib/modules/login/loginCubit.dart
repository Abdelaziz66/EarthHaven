import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xfirebase/shared/constant.dart';
import '../../shared/cubit/App_cubit.dart';
import 'loginState.dart';

class login_cubit extends Cubit<login_state> {
  login_cubit() : super(login_ini_state());
  static login_cubit get(context) => BlocProvider.of(context);


  bool isvisible = false;
  void changevisible() {
    isvisible = !isvisible;
    emit(login_changevisible_state());
  }



  void login(
      {required String email,
      required String password,
      required context}) async {


    emit(login_loading_state());
   await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // print(value.user);
      uId=value.user?.uid;


      emit(login_success_state());
      App_cubit.get(context).Get_User_Data_Function();
      App_cubit.get(context).Get_PostData_Function();

    }).catchError((error) {
      print(error.toString());
      emit(login_error_state(error.toString()));
    });
  }
}
