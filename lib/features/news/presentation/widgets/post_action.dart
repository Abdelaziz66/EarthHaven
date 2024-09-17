import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PostAction extends StatelessWidget {
  const PostAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // if (likemodel.uIds!.contains('${postmap.uid}')) {
              //   App_cubit.get(context).unlikepost_Function(
              //       postId: postId, index: index);
              // } else {
              //   App_cubit.get(context).likepost_Function(
              //       postId: postId, index: index);
              // }
            },
            icon: FaIcon(
              FontAwesomeIcons.heart,
              size: 25,
              // color: App_cubit.get(context).likeId_list!.contains(App_cubit.get(context).model?.uid) ?Colors.greenAccent:Colors.grey[200],
              color: true
                  ? Colors.greenAccent
                  : Colors.grey[200],
            ),
          ),
          Text(
            '69',
            style: TextStyle(
              color: Colors.grey[300],
            ),
          ),

          const SizedBox(
            width: 20,
          ),
          FaIcon(
            FontAwesomeIcons.comment,
            size: 25,
            color: Colors.grey[200],
          ),

          const SizedBox(
            width: 15,
          ),

          FaIcon(
            FontAwesomeIcons.angleUp,
            size: 25,
            color: Colors.grey[200],
          ),

          // Text('60',style: TextStyle(

          //   color: Colors.white,

          // ),),

          const Spacer(),

          FaIcon(
            FontAwesomeIcons.bookmark,
            size: 25,
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
