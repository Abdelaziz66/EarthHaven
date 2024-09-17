
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:flutter/material.dart';


class Titles extends StatelessWidget {
  const Titles({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style:Styles.textStyle25,
            ),
            Text(
              subtitle,
              style:Styles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}