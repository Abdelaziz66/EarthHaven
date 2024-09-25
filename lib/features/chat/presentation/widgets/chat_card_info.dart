
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
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,

          child: Row(
            children: [
              Expanded(
                child: Text(
                  chatCardEntity.name ?? '',
                  maxLines: 1,
                  overflow:TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.grey[200],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,

          child: Text(
            chatCardEntity.bio ?? '',
            maxLines: 1,
            overflow:TextOverflow.ellipsis,
            style: const TextStyle(
              // fontWeight: FontWeight.w800,

              fontSize: 13,

              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
