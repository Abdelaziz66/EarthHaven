import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_haven/core/constants/constant.dart';
import 'package:earth_haven/core/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import '../../domain/entities/chat_card_entity.dart';

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
    final newMessage = {
      'id': messageId,
      'text': message.text,
      'uid': _user.id,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .doc(messageId)
        .set(newMessage);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .doc(messageId)
        .set(newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:BackGround(widget:  Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        showUserNames: true,showUserAvatars: false,
        theme: DefaultChatTheme(
          backgroundColor: Colors.transparent,
          primaryColor:Colors.blueGrey.withOpacity(.3),
          secondaryColor: Colors.blueGrey.withOpacity(.3),

          inputTextColor: Colors.white,
          inputTextCursorColor: Colors.green,
          sentMessageBodyTextStyle: const TextStyle(color: Colors.white),
          receivedMessageBodyTextStyle: const TextStyle(color: Colors.white),
          inputContainerDecoration: BoxDecoration(
            color:Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          inputBorderRadius: BorderRadius.circular(30),
          inputMargin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),

        ),
      ),),
    );
  }
}
