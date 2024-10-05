import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/post_entity.dart';
import '../manager/news_cubit.dart';
class PostAction extends StatefulWidget {
  const PostAction({
    super.key, required this.postEntity,
  });
 final PostEntity  postEntity;

  @override
  State<PostAction> createState() => _PostActionState();
}

class _PostActionState extends State<PostAction> {
  late bool like=widget.postEntity.like;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if(like){
                setState(() {
                  like = !like;
                });
                NewsCubit.get(context).removeLike(postId: widget.postEntity.postId!);
              }else{
                setState(() {
                  like = !like;
                });
                NewsCubit.get(context).addLike(postId: widget.postEntity.postId!);
              }
            },
            icon: FaIcon(
              FontAwesomeIcons.heart,
              size: 25,
              // color: App_cubit.get(context).likeId_list!.contains(App_cubit.get(context).model?.uid) ?Colors.greenAccent:Colors.grey[200],
              color: like
                  ? Colors.greenAccent
                  : Colors.grey[200],
            ),
          ),
          Text(
            '${  widget.postEntity.numberOfLike}',
            style: TextStyle(
              color: Colors.grey[300],
            ),
          ),

          const SizedBox(
            width: 20,
          ),
          FaIcon(
            FontAwesomeIcons.comment,
            size: 20,
            color: Colors.grey[200],
          ),

          const SizedBox(
            width: 15,
          ),

          FaIcon(
            FontAwesomeIcons.angleUp,
            size: 20,
            color: Colors.grey[200],
          ),

          // Text('60',style: TextStyle(

          //   color: Colors.white,

          // ),),

          const Spacer(),

          FaIcon(
            FontAwesomeIcons.bookmark,
            size: 20,
            color: Colors.grey[200],
          ),

          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );

  }
}
