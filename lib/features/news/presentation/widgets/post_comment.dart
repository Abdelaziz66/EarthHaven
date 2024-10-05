import 'package:cached_network_image/cached_network_image.dart';
import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/constant.dart';
import '../../../chat/data/models/chat_input_model.dart';
import '../../../chat/presentation/manager/chat_cubit.dart';
import '../../domain/entities/post_entity.dart';
import 'comment_text_feild.dart';

class Comment extends StatefulWidget {
  const Comment({
    super.key, required this.postEntity,
  });
  final PostEntity postEntity;


  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  var commentController=TextEditingController();

  void _handleSendPressed() async {
    final messageId = const Uuid().v4();
    ChatInputModel chatInputModel = ChatInputModel(
      messageId: messageId,
      receiverId: widget.postEntity.uId!,
      message: {
        'id': messageId,
        'text': commentController.text,
        'uid': uId,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      },
    );
    ChatCubit.get(context).sendMessage(chatInputModel: chatInputModel);
    commentController=TextEditingController();
    showFloatingTopBanner(context: context, message: 'Message Sent  :)');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey[900],
          boxShadow: const [
            BoxShadow(
              color: Colors.white38,
              blurRadius: 5,
              spreadRadius: .5,
            ),
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 1,
                  spreadRadius: .1,
                ),
              ]),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: CachedNetworkImageProvider('${loginEntity!.profileImage}',),

              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CommentTextField(commentController: commentController),
          const Spacer(),
          const Text(
            'send',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          IconButton(
              onPressed: () {
                _handleSendPressed();
              },
              icon: const FaIcon(
                FontAwesomeIcons.paperPlane,
                size: 22,
                color: Colors.white70,
              )),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}

