

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';

class CustomTextHeaderShape extends StatelessWidget {
  const CustomTextHeaderShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0, bottom: 10, top: 30, right: 15),
      child: SizedBox(
        height: 130,
        child: GlassBoxWithCustomBorder(
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.seedling,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          'Upload image and get your report!',
                          style: Styles.textStyle17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.expand,
                        color: Colors.white70,
                        size: 18,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          'you can Scan your plant or Select image from images.',
                          maxLines: 2,
                          style: Styles.textStyle14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            color: Colors.white10,
            borderRadius: 30,
            x: 150,
            y: 150,
            border: true),
      ),
    );
  }
}
