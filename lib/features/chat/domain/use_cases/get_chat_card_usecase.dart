import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/chat_card_entity.dart';
import '../repositories/chat_card_repo.dart';


class ChatCardUseCase extends UseCase<void, NoParam> {
  final ChatCardRepo chatCardRepo;

  ChatCardUseCase({required this.chatCardRepo});
  @override
  Future<Either<Failure, List<ChatCardEntity>>> call([NoParam? param]) {
    return chatCardRepo.getChatCard();
  }
}
