import 'package:earth_haven/features/news/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.widget,
  });

  final PostItem widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.greenAccent,
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ]),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  widget.postEntity.userProfileImage ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    widget.postEntity.userName ?? '',
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
                widget.postEntity.date ?? '',
                style: const TextStyle(
                  // fontWeight: FontWeight.w800,

                  fontSize: 13,

                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.grey[300],
              )),
        ],
      ),
    );
  }
}
