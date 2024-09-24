import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_haven/core/constants/constant.dart';
import 'package:earth_haven/core/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import '../../data/models/chat_input_model.dart';
import '../../domain/entities/chat_card_entity.dart';
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
    // ChatCubit.get(context).sendMessage(chatInputModel: chatInputModel);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(chatInputModel.receiverId)
        .collection('messages')
        .doc(chatInputModel.messageId)
        .set(chatInputModel.message);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(chatInputModel.receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .doc(chatInputModel.messageId)
        .set(chatInputModel.message);
  }

  @override
  Widget build(BuildContext context) {
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
}
