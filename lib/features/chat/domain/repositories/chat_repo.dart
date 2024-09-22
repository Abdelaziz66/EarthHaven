import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/chat_card_entity.dart';

abstract class ChatCardRepo{

  Future<Either<Failure,List<ChatCardEntity>>> getChatCard();
}