import 'package:dartz/dartz.dart';
import 'package:earth_haven/features/chat/domain/entities/chat_card_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/chat_card_repo.dart';
import '../data_sources/chat_remote_data_source.dart';

class ChatCardRepoImpl extends ChatCardRepo{
 final ChatCardRemoteDataSource chatCardRemoteDataSource;


  ChatCardRepoImpl( {required this.chatCardRemoteDataSource,});

  @override
  Future<Either<Failure, List<ChatCardEntity>>> getChatCard() async {
    try{
      List<ChatCardEntity> chatCardEntity =await chatCardRemoteDataSource.getChatCard();
      return right(chatCardEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }



 

  
}