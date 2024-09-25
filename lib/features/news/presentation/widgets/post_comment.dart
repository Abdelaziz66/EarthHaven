import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';
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
    showFloatingTopBanner(context: context, message: 'Reply Sending');
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
                backgroundImage: NetworkImage(
                  loginEntity?.profileImage == ''
                      ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                      : loginEntity?.profileImage ??
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                ),
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
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                _handleSendPressed();
              },
              icon: FaIcon(
                FontAwesomeIcons.paperPlane,
                size: 22,
                color: Colors.grey[200],
              )),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}

