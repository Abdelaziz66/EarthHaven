import 'package:earth_haven/features/chat/domain/use_cases/send_message_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../data/repositories/chat_card_repo_impl.dart';
import '../../domain/use_cases/get_chat_card_usecase.dart';
import '../manager/chat_cubit.dart';
import '../widgets/chat_body.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        chatCardUseCase: ChatCardUseCase(chatRepo: getIt.get<ChatRepoImpl>()),
        sendMessageUseCase:
            SendMessageUseCase(chatRepo: getIt.get<ChatRepoImpl>()),
      )..getChatCard(),
      child: const ChatBody(),
    );
  }
}
