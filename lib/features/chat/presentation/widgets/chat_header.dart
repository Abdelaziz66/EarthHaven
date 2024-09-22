import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/glass_box.dart';
import '../../domain/entities/chat_card_entity.dart';
import '../pages/chat_ui.dart';
import 'chat_card_image.dart';
import 'chat_card_info.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    super.key,
    required this.chatCardEntity,
  });

  final ChatCardEntity chatCardEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
        child: GlassBox(
            widget: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ChatCardImage(
                      chatCardEntity: chatCardEntity),
                  const SizedBox(
                    width: 15,
                  ),
                  ChatCardInfo(chatCardEntity: chatCardEntity),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.ellipsisVertical,
                        color: Colors.grey[300],
                      )),
                ],
              ),
            ),
            color: Colors.white10,
            borderRadius: 40,
            x: 20,
            y: 20,
            border: true));
  }
}
