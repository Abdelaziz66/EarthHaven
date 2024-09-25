import 'package:earth_haven/features/news/presentation/widgets/post_action.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_caption.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_comment.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_header.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_image.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_tag.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../domain/entities/post_entity.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key, required this.postEntity});
  final PostEntity postEntity;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GlassBox(
          widget: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  PostHeader(widget: widget),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.blueGrey,
                    width: double.infinity,
                    height: .3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PostCaption(widget: widget),
                  PostTag(widget: widget),
                  PostImage(widget: widget),
                  const SizedBox(
                    height: 10,
                  ),
                  const PostAction(),
                  const SizedBox(
                    height: 10,
                  ),
                   Comment(postEntity: widget.postEntity,),
                ],
              ),
            ),
          ),
          color: Colors.blueGrey.withOpacity(.3),
          borderRadius: 25,
          x: 50,
          y: 50,
        border: false,
      ),
    );
  }
}

