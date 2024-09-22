


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/chat_input_model.dart';
import '../repositories/chat_repo.dart';

class SendMessageUseCase extends UseCase<void, ChatInputModel> {
  final ChatRepo chatRepo;

  SendMessageUseCase({required this.chatRepo});
  @override
  Future<Either<Failure, void>> call([ChatInputModel? chatInputModel]) {
    return chatRepo.sendMessage(chatInputModel:chatInputModel!);
  }
}
