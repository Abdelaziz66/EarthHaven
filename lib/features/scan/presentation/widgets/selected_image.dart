import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';


class SelectedImageForScan extends StatelessWidget {
  const SelectedImageForScan({
    super.key,
    required this.postImage,
  });

  final File? postImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConditionalBuilder(
        condition: postImage != null,
        builder: (context) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey,
            image: DecorationImage(
              image: FileImage(postImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        fallback: (context) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/plant1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
