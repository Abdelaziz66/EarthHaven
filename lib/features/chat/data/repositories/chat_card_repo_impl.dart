import 'package:dartz/dartz.dart';
import 'package:earth_haven/features/chat/data/models/chat_input_model.dart';
import 'package:earth_haven/features/chat/domain/entities/chat_card_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/chat_repo.dart';
import '../data_sources/chat_remote_data_source.dart';

class ChatRepoImpl extends ChatRepo{
 final ChatRemoteDataSource chatRemoteDataSource;


 ChatRepoImpl( {required this.chatRemoteDataSource,});

  @override
  Future<Either<Failure, List<ChatCardEntity>>> getChatCard() async {
    try{
      List<ChatCardEntity> chatCardEntity =await chatRemoteDataSource.getChatCard();
      return right(chatCardEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage({required ChatInputModel chatInputModel})async {
    try{
     await chatRemoteDataSource.sendMessage(chatInputModel: chatInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}