import 'package:earth_haven/features/news/presentation/widgets/post_listview.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PostListview(),

      ],
    );
  }
}
