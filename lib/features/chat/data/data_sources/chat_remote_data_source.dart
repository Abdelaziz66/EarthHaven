import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/functions/user_data.dart';
import '../../../../core/utils/google_auth.dart';
import '../../domain/entities/chat_card_entity.dart';

abstract class ChatCardRemoteDataSource {
  Future<List<ChatCardEntity>> getChatCard();
}

class ChatCardRemoteDataSourceImpl extends ChatCardRemoteDataSource {
  @override
  Future<List<ChatCardEntity>> getChatCard() async {
    List<ChatCardEntity> chatCardEntity = [];
    await FirebaseFirestore.instance.collection('users').get().then((value) async {
      chatCardEntity = await setUsersDataFunction(value: value);
      return chatCardEntity;
    });

    return chatCardEntity;
  }
}
