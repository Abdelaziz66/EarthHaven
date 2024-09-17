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
        condition: true,
        builder: (context) => Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {},
                minWidth: 1,
                padding: EdgeInsets.zero,
                child:  Text(
                  widget.postEntity.tag==null?'': widget.postEntity.tag!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
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
