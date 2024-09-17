import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey[900],
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 1,
              spreadRadius: .1,
            ),
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1,
                      spreadRadius: .1,
                    ),
                  ]),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  '',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 150,
            height: 30,
            child: TextFormField(
              // controller: comment_controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text(
                  'Add Comment Here ..',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'comment',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                // App_cubit.get(context).commentpost_Function(postId: postId, index: index, comment: comment_controller!.text);
              },
              icon: FaIcon(
                FontAwesomeIcons.commentDots,
                size: 25,
                color: Colors.grey[200],
              )),
        ],
      ),
    );
  }
}
