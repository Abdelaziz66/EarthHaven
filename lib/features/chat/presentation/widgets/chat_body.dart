import 'package:earth_haven/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'chat_card_item.dart';
import 'chat_card_listview.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         // Padding(
         //   padding: const EdgeInsets.all(8.0),
         //   child: GestureDetector(
         //     onTap: (){
         //       GoRouter.of(context).push(AppRouter.kChatPage);
         //     },
         //       child: const ChatCardItem(chatCardEntity: ,)),
         // ),
         const ChatCardListview(),
      ],
    );
  }
}
