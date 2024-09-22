import 'package:earth_haven/features/chat/domain/entities/chat_card_entity.dart';
import 'package:earth_haven/features/chat/presentation/pages/chat_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/glass_box.dart';
import 'chat_card_image.dart';
import 'chat_card_info.dart';

class ChatCardItem extends StatelessWidget {
  const ChatCardItem({super.key, required this.chatCardEntity});
  final ChatCardEntity chatCardEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kChatPage,extra: chatCardEntity);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
        child: GlassBox(
          widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ChatCardImage(chatCardEntity: chatCardEntity),
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
          color: Colors.blueGrey.withOpacity(.3),
          borderRadius: 30,
          x: 50,
          y: 50,
          border: false,
        ),
      ),
    );
  }
}



