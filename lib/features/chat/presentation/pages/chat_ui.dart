import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_haven/core/constants/constant.dart';
import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:earth_haven/core/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../data/models/chat_input_model.dart';
import '../../data/repositories/chat_card_repo_impl.dart';
import '../../domain/entities/chat_card_entity.dart';
import '../../domain/use_cases/get_chat_card_usecase.dart';
import '../../domain/use_cases/send_message_usecase.dart';
import '../manager/chat_cubit.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.chatCardEntity});
  final ChatCardEntity chatCardEntity;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  late final String receiverId = widget.chatCardEntity.uid!;
  late final types.User _user = types.User(id: uId!);
  late BuildContext bigContext;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      final messages = snapshot.docs
          .map((doc) => types.TextMessage(
                id: doc.id,
                author: types.User(id: doc['uid']),
                text: doc['text'],
                createdAt: doc['createdAt'],
              ))
          .toList();
      setState(() {
        _messages.clear();
        _messages.addAll(messages);
      });
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final messageId = const Uuid().v4();
    ChatInputModel chatInputModel = ChatInputModel(
      messageId: messageId,
      receiverId: receiverId,
      message: {
        'id': messageId,
        'text': message.text,
        'uid': _user.id,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      },
    );
    ChatCubit.get(bigContext).sendMessage(chatInputModel: chatInputModel);

  }

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) {
        return ChatCubit(
          chatCardUseCase: ChatCardUseCase(chatRepo: getIt.get<ChatRepoImpl>()),
          sendMessageUseCase:
          SendMessageUseCase(chatRepo: getIt.get<ChatRepoImpl>()),
        );
      },
      child:Builder(
        builder: (context) {
          bigContext = context;
          return Scaffold(
          backgroundColor: Colors.black,
          body: BackGround(
            widget: SafeArea(
              child: Column(
                children: [
                  ChatHeader(chatCardEntity: widget.chatCardEntity),
                  Expanded(
                    child: Chat(
                      messages: _messages,
                      onSendPressed: _handleSendPressed,
                      user: _user,
                      showUserNames: true,
                      showUserAvatars: false,
                      scrollPhysics: const BouncingScrollPhysics(),
                      theme: customChatTheme(),
                    ),
                  ),
                ],
              ),
            ),
          ),
              );
        }
      ),
    );
  }
}
