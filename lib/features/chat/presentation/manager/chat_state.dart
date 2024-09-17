
import '../../domain/entities/chat_card_entity.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}
class ChatCardLoadingState extends ChatState {}
class ChatCardSuccessState extends ChatState {
  final List<ChatCardEntity> chatCardEntity;
  ChatCardSuccessState({required this.chatCardEntity});
}
class ChatCardErrorState extends ChatState {
  final String errMessage;
  ChatCardErrorState(this.errMessage);
}

