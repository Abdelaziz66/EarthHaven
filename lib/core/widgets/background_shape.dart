
import 'package:flutter/material.dart';

class BackGroundShape extends StatelessWidget {
  const BackGroundShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.greenAccent,
          ),
        ),
        const Spacer(),
        Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}