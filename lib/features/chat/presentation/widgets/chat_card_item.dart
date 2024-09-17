import 'package:earth_haven/features/chat/domain/entities/chat_card_entity.dart';
import 'package:earth_haven/features/chat/presentation/pages/chat_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/glass_box.dart';

class ChatCardItem extends StatelessWidget {
  const ChatCardItem({super.key, required this.chatCardEntity});
  final ChatCardEntity chatCardEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(chatCardEntity: chatCardEntity),
            ));
        // GoRouter.of(context).push(AppRouter.kChatPage,extra: chatCardEntity);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
        child: GlassBox(
          widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                _Image(chatCardEntity: chatCardEntity),
                const SizedBox(
                  width: 15,
                ),
                _UserInfo(chatCardEntity: chatCardEntity),
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

class _UserInfo extends StatelessWidget {
  const _UserInfo({
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


class _Image extends StatelessWidget {
  const _Image({
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
