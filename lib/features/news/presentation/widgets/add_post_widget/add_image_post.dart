

import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/style/colors.dart';
import '../../../../../core/widgets/glass_box.dart';
import '../../manager/news_cubit.dart';
import 'custom_bar_add_post.dart';

class AddImagePost extends StatelessWidget {
  const AddImagePost({
    super.key,
    required this.postImage,required this.state, required this.captionController, required this.tagsController,
  });

  final File? postImage;
  final NewsState? state;
  final TextEditingController captionController;
  final TextEditingController tagsController;


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
                CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.end,
                children: [
                  FadeInLeft(
                    delay: const Duration(milliseconds: 400),


                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColors.primaryColor,
                          ),
                          child: IconButton(
                              onPressed: () {
                                NewsCubit.get(context)
                                    .pickImage(imageSource: ImageSource.gallery);
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.image,
                                color: Colors.grey[300],
                              ))),
                    ),
                  ),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColors.primaryColor,
                          ),
                          child: IconButton(
                              onPressed: () {
                                NewsCubit.get(context)
                                    .pickImage(imageSource: ImageSource.camera);
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[300],
                              ))),
                    ),
                  ),
                  FadeInLeft(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomBar(captionController: captionController, tagsController: tagsController, state: state,),
                  )),
                ],
              ),
              fallback: (context) => const SizedBox(),
            ),
            ConditionalBuilder(
              condition: state is UploadImageLoadingState,
              builder: (context) => GlassBox(
                  widget: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0),
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: KColors.thirdColor,
                        size: 80,
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