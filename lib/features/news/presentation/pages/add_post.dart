import 'dart:io';

import 'package:earth_haven/core/widgets/custom_text_form_field.dart';
import 'package:earth_haven/features/news/domain/use_cases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../../../core/widgets/background.dart';
import '../../data/repositories/post_repo_impl.dart';
import '../../domain/use_cases/get_post_usecase.dart';
import '../../domain/use_cases/upload_post_usecase.dart';
import '../manager/news_cubit.dart';
import '../widgets/add_post_widget/add_image_post.dart';
import '../widgets/add_post_widget/custom_bar_add_post.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var captionController = TextEditingController();
  var tagsController = TextEditingController();
  File? postImage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        getPostUseCase: GetPostUseCase(postRepo: getIt.get<PostRepoImpl>()),
        uploadPostUseCase:
            UploadPostUseCase(postRepo: getIt.get<PostRepoImpl>()),
        uploadImageUseCase:
            UploadImageUseCase(postRepo: getIt.get<PostRepoImpl>()),
      ),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is ImagePickedSuccessState) {
            postImage = state.postImage;
          }
          if (state is UploadPostSuccessState) {
            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BackGround(
              widget: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBar(captionController: captionController, tagsController: tagsController, state: state,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'What is in your mind ?',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey[200],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: CustomTextFormField(
                                  controller: captionController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Caption',
                                  prefixIcon: FontAwesomeIcons.pen,
                                  obscureText: false,
                                  suffix: const SizedBox(),
                                  borderRadius: 20),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: CustomTextFormField(
                                  controller: tagsController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Tags',
                                  prefixIcon: FontAwesomeIcons.tag,
                                  obscureText: false,
                                  suffix: const SizedBox(),
                                  borderRadius: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AddImagePost(postImage: postImage, state: state,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

