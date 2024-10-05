import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
class PostTag extends StatelessWidget {
  const PostTag({
    super.key,
    required this.widget,
  });

  final PostItem widget;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: widget.postEntity.tag != '',
        builder: (context) => Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
          child: Row(
            children: [
              Text(
               widget.postEntity.tag??'',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        fallback: (context) => const SizedBox(
          height: 10,
        ));
  }
}
