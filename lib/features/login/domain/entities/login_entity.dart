import 'package:hive/hive.dart';
part'login_entity.g.dart';


@HiveType(typeId: 1)
class LoginEntity{
 @HiveField(0)
 final String? email;
 @HiveField(1)
 final String? uid;
 @HiveField(2)
 final String? name;
 @HiveField(3)
 final String? phone;
 @HiveField(4)
 final String? profileImage;
 @HiveField(5)
 final String? bio;
 @HiveField(6)
 final bool? isEmailVerified;


 LoginEntity( {required this.bio,required this.isEmailVerified,required this.profileImage,required this.email,required this.uid, required this.name,required this.phone});

}