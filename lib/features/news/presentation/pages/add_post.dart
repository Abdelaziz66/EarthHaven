import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/features/news/domain/use_cases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../data/repositories/post_repo_impl.dart';
import '../../domain/use_cases/get_post_usecase.dart';
import '../../domain/use_cases/upload_post_usecase.dart';
import '../manager/news_cubit.dart';

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
          if(state is UploadPostSuccessState){
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
                    Padding(
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
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Post',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.greenAccent[400],
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
                    ),
                    ConditionalBuilder(
                      condition: state is UploadPostSuccessState,
                      builder: (context) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(),
                      ),
                      fallback: (context) => const SizedBox(),
                    ),
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
                              height: 8,
                            ),
                            Container(
                              color: Colors.blueGrey,
                              width: double.infinity,
                              height: .3,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GlassBox(
                                widget: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(.8),
                                          style: BorderStyle.solid,
                                          width: 1.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  height: 30,
                                                  child: TextFormField(
                                                    controller:
                                                        captionController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    style: TextStyle(
                                                      color: Colors.grey[300],
                                                    ),
                                                    decoration: InputDecoration(
                                                      suffixText: 'Description',
                                                      suffixStyle: TextStyle(
                                                        color: Colors.grey[300],
                                                      ),
                                                      border: InputBorder.none,
                                                      label: Text(
                                                        '',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[300],
                                                        ),
                                                      ),
                                                      prefixIcon: FaIcon(
                                                        FontAwesomeIcons
                                                            .keyboard,
                                                        size: 25,
                                                        color: Colors.grey[200],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 50,
                                y: 50,
                                border: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GlassBox(
                                widget: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(.8),
                                          style: BorderStyle.solid,
                                          width: 1.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  height: 30,
                                                  child: TextFormField(
                                                    controller: tagsController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    style: TextStyle(
                                                      color: Colors.grey[300],
                                                    ),
                                                    decoration: InputDecoration(
                                                      suffixText: 'Hashtags',
                                                      suffixStyle: TextStyle(
                                                        color: Colors.grey[300],
                                                      ),
                                                      label: Text(
                                                        '',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[300],
                                                        ),
                                                      ),
                                                      prefixIcon: FaIcon(
                                                        FontAwesomeIcons
                                                            .hashtag,
                                                        size: 25,
                                                        color: Colors.grey[200],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 50,
                                y: 50,
                                border: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ConditionalBuilder(
                              condition: state is UploadPostLoadingState,
                              builder: (context) => const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: LinearProgressIndicator(),
                              ),
                              fallback: (context) => const SizedBox(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GlassBox(
                                widget: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(.8),
                                          style: BorderStyle.solid,
                                          width: 1.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        ConditionalBuilder(
                                          condition: postImage == null,
                                          builder: (context) => Container(
                                            width: double.infinity,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          fallback: (context) => Container(
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.greenAccent[400],
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    NewsCubit.get(context).pickImage();
                                                  },
                                                  icon: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.grey[300],
                                                  ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 50,
                                y: 50,
                                border: false,
                              ),
                            ),
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
