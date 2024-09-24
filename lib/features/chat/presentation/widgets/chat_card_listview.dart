import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chat_card_entity.dart';
import '../manager/chat_cubit.dart';
import '../manager/chat_state.dart';
import 'chat_card_item.dart';


class ChatCardListview extends StatefulWidget {
  const ChatCardListview({super.key});

  @override
  State<ChatCardListview> createState() => _ChatCardListviewState();
}

class _ChatCardListviewState extends State<ChatCardListview> {
  static List<ChatCardEntity> chatCardEntity=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if(state is ChatCardSuccessState){
          showSnackBar(context: context, message: 'get card');
          chatCardEntity=state.chatCardEntity;
        }
      },
      builder: (context, state) {
       if(chatCardEntity.isNotEmpty){
          return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>  ChatCardItem(chatCardEntity: chatCardEntity[index],),
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 0,
                  ),
                  itemCount: chatCardEntity.length,
                ),
              ));
        }else if(state is ChatCardLoadingState || chatCardEntity.isEmpty){
        return const Expanded(child: Center(child: CircularProgressIndicator()));
        }
        else{
        return const Expanded(child: Center(child: Text('No chats here yet',style: Styles.textStyle16,)));
        }
      },
    );
  }
}
