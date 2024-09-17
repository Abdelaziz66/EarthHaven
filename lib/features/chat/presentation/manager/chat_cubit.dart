import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/constant.dart';
import '../../domain/use_cases/get_chat_card_usecase.dart';
import 'chat_state.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
      {required this.chatCardUseCase})
      : super(ChatInitial());

  static ChatCubit get(context)=>BlocProvider.of(context);

  final ChatCardUseCase chatCardUseCase;
  void getChatCard() async {
    emit(ChatCardLoadingState());
    var result = await chatCardUseCase.call();
    result.fold((failure) {
      emit(ChatCardErrorState(failure.toString()));
    }, (right) {
      emit(ChatCardSuccessState(chatCardEntity:right));
    });
  }


}
