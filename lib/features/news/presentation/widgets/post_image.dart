import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.widget,
  });

  final PostItem widget;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition:  widget.postEntity.image !='',
        builder: (context) => Padding(
          padding: const EdgeInsets.only(
              left: 0, right: 0.0, top: 5),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                image: NetworkImage(
                  widget.postEntity.image!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        fallback: (context) => const SizedBox(
          height: 0,
        ));
  }
}
