import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/login/data/models/login_model.dart';
import '../../../features/login/domain/entities/login_entity.dart';
import '../../../features/register/data/models/register_model.dart';
import '../../features/chat/data/models/chat_card_model.dart';
import '../../features/chat/domain/entities/chat_card_entity.dart';

Future<void> createUserData(
    {required LoginModel loginModel, required uid}) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).set(loginModel.toMap());
}

Future<LoginEntity> getUserDataFunction({required uid}) async {
  LoginEntity? loginEntity;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((value) {
    loginEntity = LoginModel.fromJson(value.data());
    return loginEntity;
  });
  return loginEntity!;
}

Future<List<ChatCardEntity>> setUsersDataFunction({required  QuerySnapshot<Map<String, dynamic>>value}) async {
  List<ChatCardEntity> chatCardEntity=[];
  for (int i = 0; i < value.docs.length; i++) {
    chatCardEntity.add(ChatCardModel.fromJson(value.docs[i].data()));
  }
  return chatCardEntity;
}

Future<void> newAccount(onValue, User user) async {
  if (onValue.additionalUserInfo!.isNewUser) {
    LoginModel loginModel = LoginModel(
        phone: user.phoneNumber,
        name: user.displayName,
        email: user.email,
        uid: onValue.user.uid,
        bio: '',
        isEmailVerified: false,
        profileImage:'');
    await createUserData(
      loginModel: loginModel,
      uid: onValue.user.uid,
    );
  }
}
