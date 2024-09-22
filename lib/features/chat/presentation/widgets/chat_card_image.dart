
import 'package:flutter/material.dart';

import '../../domain/entities/chat_card_entity.dart';

class ChatCardImage extends StatelessWidget {
  const ChatCardImage({super.key,
    required this.chatCardEntity,
  });

  final ChatCardEntity chatCardEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.greenAccent,
          blurRadius: 2,
          spreadRadius: 2,
        ),
      ]),
      child: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(chatCardEntity.profileImage ==
            ''
            ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
            : chatCardEntity.profileImage ??
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
      ),
    );
  }
}
