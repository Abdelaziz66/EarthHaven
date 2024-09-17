import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/functions/user_data.dart';
import '../../../../core/utils/google_auth.dart';
import '../../../register/data/models/register_model.dart';
import '../../domain/entities/login_entity.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> login({required LoginDataModel loginDataModel});
  Future<LoginEntity> googleLogin();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {

  @override
  Future<LoginEntity> login({required LoginDataModel loginDataModel}) async {
    LoginEntity? loginEntity;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: loginDataModel.email!, password: loginDataModel.password!)
        .then((value) async {
      loginEntity = await getUserDataFunction(uid: value.user?.uid);

      return loginEntity;
    });
    return loginEntity!;
  }

  @override
  Future<LoginEntity> googleLogin() async {
    LoginEntity? loginEntity;
    await AuthService.signInWithGoogle().then((onValue) async {
      User user = onValue.user;
      await newAccount(onValue, user);
      loginEntity = await getUserDataFunction(uid: onValue.user.uid);
      return loginEntity!;
    });
    return loginEntity!;
  }


}
