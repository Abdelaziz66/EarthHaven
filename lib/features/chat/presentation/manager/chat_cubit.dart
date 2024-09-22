import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_input_model.dart';
import '../../domain/use_cases/get_chat_card_usecase.dart';
import '../../domain/use_cases/send_message_usecase.dart';
import 'chat_state.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
      {required this.chatCardUseCase,required this.sendMessageUseCase,})
      : super(ChatInitial());

  static ChatCubit get(context)=>BlocProvider.of(context);

  final ChatCardUseCase chatCardUseCase;
  final SendMessageUseCase sendMessageUseCase;

  void getChatCard() async {
    emit(ChatCardLoadingState());
    var result = await chatCardUseCase.call();
    result.fold((failure) {
      emit(ChatCardErrorState(failure.toString()));
    }, (right) {
      emit(ChatCardSuccessState(chatCardEntity:right));
    });
  }

  void sendMessage({required ChatInputModel chatInputModel}) async {
    emit(SendMessageLoadingState());
    var result = await sendMessageUseCase.call(chatInputModel);
    result.fold((failure) {
      emit(SendMessageErrorState(failure.toString()));
    }, (right) {
      emit(SendMessageSuccessState());
    });
  }


}
