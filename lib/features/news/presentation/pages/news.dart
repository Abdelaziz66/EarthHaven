import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:earth_haven/core/functions/setup_service_locator.dart';
import 'package:earth_haven/features/news/data/data_sources/post_remote_data_source.dart';
import 'package:earth_haven/features/news/data/repositories/post_repo_impl.dart';
import 'package:earth_haven/features/news/domain/use_cases/get_post_usecase.dart';
import 'package:earth_haven/features/news/domain/use_cases/upload_post_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../domain/repositories/post_repo.dart';
import '../../domain/use_cases/upload_image_usecase.dart';
import '../manager/news_cubit.dart';
import '../widgets/news_body.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        getPostUseCase: GetPostUseCase(postRepo: getIt.get<PostRepoImpl>()),
        uploadPostUseCase:
        UploadPostUseCase(postRepo: getIt.get<PostRepoImpl>()),
        uploadImageUseCase:
        UploadImageUseCase(postRepo: getIt.get<PostRepoImpl>()),
      )..getPost(),
      child: const NewsBody(),
    );
  }
}
