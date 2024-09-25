

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../core/widgets/glass_box.dart';
import '../../manager/news_cubit.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    required this.captionController,
    required this.tagsController,required this.state,
  });

  final TextEditingController captionController;
  final TextEditingController tagsController;
  final NewsState? state;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
          const Spacer(),
          GlassBox(
            widget: InkWell(
              onTap: () {
                NewsCubit.get(context).uploadPost(
                  caption: captionController.text,
                  tag: tagsController.text,
                );
              },
              child:    ConditionalBuilder(
                condition: state is UploadPostLoadingState,
                builder: (context) =>  SizedBox(
                    height: 25,
                    width: 25,
                    child:  LoadingAnimationWidget.dotsTriangle(
          color: Colors.white,
          size: 30,
        )),
                fallback: (context) =>const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                      'Post',
                      style: Styles.textStyle18Bold
                  ),
                ),
              ),
            ),
            color: Colors.transparent,
            borderRadius: 15,
            x: 40,
            y: 40,
            border: false,
          ),
        ],
      ),
    );
  }
}