import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../../data/models/chat_input_model.dart';
import '../entities/chat_card_entity.dart';

abstract class ChatRepo{

  Future<Either<Failure,List<ChatCardEntity>>> getChatCard();
  Future<Either<Failure,void>> sendMessage({required ChatInputModel chatInputModel});

}