import 'package:animate_do/animate_do.dart';
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../manager/news_cubit.dart';

class PostListview extends StatefulWidget {
  const PostListview({super.key});

  @override
  State<PostListview> createState() => _PostListviewState();
}

class _PostListviewState extends State<PostListview> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // if(state is PostSuccessState){
        //   // postEntity=PostSuccessState.postEntity;
        //   print(PostSuccessState.postEntity.length);
        // }
      },
      builder: (context, state) {
        if (PostSuccessState.postEntity.isNotEmpty) {
          return Expanded(
            child: FadeInUp(
              child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 100),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      PostItem(
                        postEntity: PostSuccessState.postEntity[index]!,
                      ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 5,
                  ),
                  itemCount: PostSuccessState.postEntity.length),
            ),
          );
        } else if (PostSuccessState.postEntity.isEmpty &&
            state is PostLoadingState) {
          return  Expanded(
              child: Center(child:  LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 70,
        )));
        } else {
          return const Expanded(
              child: Center(
                  child: Text(
                    'No posts here yet',
                    style: Styles.textStyle16,
                  )));
        }
      },
    );
  }
}

