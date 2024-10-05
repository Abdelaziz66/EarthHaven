import 'dart:io';

import 'package:earth_haven/features/scan/presentation/widgets/selected_buttons.dart';
import 'package:earth_haven/features/scan/presentation/widgets/selected_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/glass_box.dart';
import '../manager/scan_state.dart';

class ImageOrCamera extends StatelessWidget {
  const ImageOrCamera({
    super.key,
    required this.postImage,
    required this.state,
  });
  final File? postImage;
  final ScanState? state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 200,
        child: GlassBox(
            widget: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    const SelectedButtons(),
                    SelectedImageForScan(postImage: postImage),
                  ],
                ),
              ),
            ),
            color: Colors.blueGrey.withOpacity(.1),
            borderRadius: 25,
            x: 100,
            y: 100,
            border: true),
      ),
    );
  }
}

