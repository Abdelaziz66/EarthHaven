
import '../../domain/entities/checkPlant_card_entity.dart';

class CheckPlantCardModel extends CheckPlantCardEntity {
  CheckPlantCardModel(
      {required super.bio,
      required super.profileImage,
      required super.email,
      required super.uid,
      required super.name,
      required super.phone});

  factory CheckPlantCardModel.fromJson(Map<String?, dynamic>? json) => CheckPlantCardModel(
        email: json?['email'],
        uid: json?['uid'],
        name: json?['name'],
        phone: json?['phone'],
        bio: json?['bio'],
        profileImage: json?['profileImage'],
      );

  Map<String, dynamic> toMap() {
    return {
      'email': super.email,
      'uid': super.uid,
      'name': super.name,
      'phone': super.phone,
      'bio': super.bio,
      'profileImage': super.profileImage,
    };
  }
}

