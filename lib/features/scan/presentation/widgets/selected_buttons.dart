

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';
import '../manager/scan_cubit.dart';
class SelectedButtons extends StatelessWidget {
  const SelectedButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: FadeInDown(
              delay: const Duration(milliseconds: 500),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    ScanCubit.get(context).pickImage(
                        imageSource: ImageSource.gallery);
                  },
                  child: const GlassBox(
                      widget: Center(
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Gallery',
                              style: Styles.textStyle18,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white10,
                      borderRadius: 20,
                      x: 0,
                      y: 0,
                      border: true),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: FadeInDown(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    ScanCubit.get(context).pickImage(
                        imageSource: ImageSource.camera);
                  },
                  child: const GlassBox(
                      widget: Center(
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.camera,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Camera',
                              style: Styles.textStyle18,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white10,
                      borderRadius: 20,
                      x: 0,
                      y: 0,
                      border: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
