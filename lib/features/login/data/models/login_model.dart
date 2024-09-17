import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel(
      {required super.bio,
      required super.isEmailVerified,
      required super.profileImage,
      required super.email,
      required super.uid,
      required super.name,
      required super.phone});

  factory LoginModel.fromJson(Map<String?, dynamic>? json) => LoginModel(
        email: json?['email'],
        uid: json?['uid'],
        name: json?['name'],
        phone: json?['phone'],
        bio: json?['bio'],
        isEmailVerified: json?['isEmailVerified'],
        profileImage: json?['profileImage'],
      );

  Map<String, dynamic> toMap() {
    return {
      'email': super.email,
      'uid': super.uid,
      'name': super.name,
      'phone': super.phone,
      'bio': super.bio,
      'isEmailVerified': super.isEmailVerified,
      'profileImage': super.profileImage,
    };
  }
}

class LoginDataModel {
  String? email;
  String? password;

  LoginDataModel({
    this.email,
    this.password,
  });
}
