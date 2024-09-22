import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/user_data.dart';
import '../../domain/entities/chat_card_entity.dart';

import '../models/chat_input_model.dart';


abstract class ChatRemoteDataSource {
  Future<List<ChatCardEntity>> getChatCard();
  Future<void> sendMessage({required ChatInputModel chatInputModel});

}

class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  @override
  Future<List<ChatCardEntity>> getChatCard() async {
    List<ChatCardEntity> chatCardEntity = [];
    await FirebaseFirestore.instance.collection('users').get().then((value) async {
      chatCardEntity = await setUsersDataFunction(value: value);
      return chatCardEntity;
    });

    return chatCardEntity;
  }

  @override
  Future<void> sendMessage({required ChatInputModel chatInputModel}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(chatInputModel.receiverId)
        .collection('messages')
        .doc(chatInputModel.messageId)
        .set(chatInputModel.message);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(chatInputModel.receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .doc(chatInputModel.messageId)
        .set(chatInputModel.message);
  }
}
