import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/chat_card_entity.dart';
import '../repositories/chat_repo.dart';


class ChatCardUseCase extends UseCase<void, NoParam> {
  final ChatRepo chatRepo;

  ChatCardUseCase({required this.chatRepo});
  @override
  Future<Either<Failure, List<ChatCardEntity>>> call([NoParam? param]) {
    return chatRepo.getChatCard();
  }
}
