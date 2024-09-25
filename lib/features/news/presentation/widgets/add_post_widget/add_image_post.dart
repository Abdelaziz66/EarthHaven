

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/style/colors.dart';
import '../../../../../core/widgets/glass_box.dart';
import '../../manager/news_cubit.dart';

class AddImagePost extends StatelessWidget {
  const AddImagePost({
    super.key,
    required this.postImage,required this.state,
  });

  final File? postImage;
  final NewsState? state;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ConditionalBuilder(
              condition: postImage != null,
              builder: (context) => Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(20),
                  color: Colors.blueGrey,
                  image: DecorationImage(
                    image: FileImage(postImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              fallback: (context) => const SizedBox(),
            ),
            ConditionalBuilder(
              condition: state is! UploadImageLoadingState,
              builder: (context) => Row(
                crossAxisAlignment:
                CrossAxisAlignment.end,
                mainAxisAlignment:
                MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: KColors.primaryColor,
                        ),
                        child: IconButton(
                            onPressed: () {
                              NewsCubit.get(context)
                                  .pickImage();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.grey[300],
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: KColors.primaryColor,
                        ),
                        child: IconButton(
                            onPressed: () {
                              NewsCubit.get(context)
                                  .pickImage();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[300],
                            ))),
                  ),
                ],
              ),
              fallback: (context) => const SizedBox(),
            ),
            ConditionalBuilder(
              condition: state is UploadImageLoadingState,
              builder: (context) => GlassBox(
                  widget: SizedBox(
                    height: 200,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          vertical: 97.5,
                          horizontal: 50),
                      child: LinearProgressIndicator(
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  color: Colors.white12,
                  borderRadius: 20,
                  x: 3,
                  y: 3,
                  border: false),

              fallback: (context) => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}