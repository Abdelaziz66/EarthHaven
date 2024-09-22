import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/user_data.dart';
import '../../domain/entities/checkPlant_card_entity.dart';

import '../models/checkPlant_input_model.dart';


abstract class CheckPlantRemoteDataSource {
  Future<List<CheckPlantCardEntity>> getCheckPlantCard();
  Future<void> checkPlant({required CheckPlantInputModel checkPlantInputModel});

}

class CheckPlantRemoteDataSourceImpl extends CheckPlantRemoteDataSource {
  @override
  Future<List<CheckPlantCardEntity>> getCheckPlantCard() async {
    List<CheckPlantCardEntity> checkPlantCardEntity = [];
    await FirebaseFirestore.instance.collection('users').get().then((value) async {
      checkPlantCardEntity = await setUsersDataFunction(value: value);
      return checkPlantCardEntity;
    });

    return checkPlantCardEntity;
  }

  @override
  Future<void> checkPlant({required CheckPlantInputModel checkPlantInputModel}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('checkPlants')
        .doc(checkPlantInputModel.receiverId)
        .collection('messages')
        .doc(checkPlantInputModel.messageId)
        .set(checkPlantInputModel.message);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(checkPlantInputModel.receiverId)
        .collection('checkPlants')
        .doc(uId)
        .collection('messages')
        .doc(checkPlantInputModel.messageId)
        .set(checkPlantInputModel.message);
  }
}
