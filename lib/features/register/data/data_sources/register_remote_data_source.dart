import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/functions/user_data.dart';
import '../../../login/data/models/login_model.dart';
import '../models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register({required RegisterModel registerModel});
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  @override
  Future<void> register({required RegisterModel registerModel}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: registerModel.email!, password: registerModel.password!)
        .then((value) async {
      LoginModel loginModel = LoginModel(
          phone: registerModel.phone,
          name: registerModel.name,
          email: registerModel.email,
          uid: value.user!.uid,
          bio: '',
          isEmailVerified: false,
          profileImage:'');
      await createUserData(
        loginModel: loginModel,
        uid: value.user!.uid,
      );
    });
  }
}
