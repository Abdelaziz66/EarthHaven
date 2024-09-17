
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: true,
      gradient:  LinearGradient(
        colors: [
          Colors.grey.shade200,
          Colors.white,
          Colors.grey.shade200,
          Colors.white,
          Colors.grey.shade200,
          Colors.white,
          Colors.grey.shade200,
        ],
        tileMode: TileMode.clamp,

      ),
      child: widget,
    );

  }
}
