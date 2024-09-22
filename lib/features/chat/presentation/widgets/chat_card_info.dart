
import 'package:flutter/material.dart';

import '../../domain/entities/chat_card_entity.dart';

class ChatCardInfo extends StatelessWidget {
  const ChatCardInfo({super.key,
    required this.chatCardEntity,
  });

  final ChatCardEntity chatCardEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              chatCardEntity.name ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.verified,
              size: 18,
              color: Colors.blue,
            ),
          ],
        ),
        Text(
          chatCardEntity.bio ?? '',
          style: const TextStyle(
            // fontWeight: FontWeight.w800,

            fontSize: 13,

            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
