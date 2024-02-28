import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xfirebase/modules/login/registerstate.dart';

import '../../models/user/create user.dart';

class register_cubit extends Cubit<register_state> {
  register_cubit() : super(register_ini_state());
  static register_cubit get(context) => BlocProvider.of(context);

  bool isvisible = false;
  void changevisible() {
    isvisible = !isvisible;
    emit(register_changevisible_state());
  }

  void register({
    required String email,
    required String password,
    required String name,
    required String phone,

  }) async {
    emit(register_loading_state());


    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Create_user_Database_Function(phone: phone,name: name,email: email,uid: value.user!.uid,isemailV: false,bio: '...',image: 'https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491_640.jpg');
      emit(register_success_state());
    }).catchError((error) {

      print(error.toString());
      emit(register_error_state());

    });
  }

  void Create_user_Database_Function({
    required String? email,
    required String? uid,
    required String? name,
    required String? phone,
     String? image='https://img.freepik.com/free-photo/little-fashion-girl-with-bag_71767-100.jpg?t=st=1692614461~exp=1692615061~hmac=ead6fc66e8c222a98def0a961d3b6509d05866fee1fd1e5b50a513a158d500e8',
    required String? bio,
    required bool isemailV,

  }) async {
    emit(usercreate_loading_state());
    user_model model =user_model(
      name:name,email:email,phone:phone,uid:uid, isemailV:isemailV,image:image,bio:bio
    );


   await FirebaseFirestore.instance.collection('users').doc(uid).set(model.tomap())
        .then((value) {
      emit(usercreate_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(usercreate_error_state());
    });
  }
}
