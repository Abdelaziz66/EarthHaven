  import 'package:flutter/material.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, required this.paddingRight, required this.height});
  final double paddingRight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right: paddingRight),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
    );
  }
}
