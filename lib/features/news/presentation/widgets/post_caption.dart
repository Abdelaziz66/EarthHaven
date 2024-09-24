import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
class PostCaption extends StatelessWidget {
  const PostCaption({
    super.key,
    required this.widget,
  });

  final PostItem widget;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition:  widget.postEntity.caption != '',
        builder: (context) => Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                widget.postEntity.caption??'',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
        ),
        fallback: (context) => const SizedBox(
          height: 0,
        ));
  }
}
