import 'package:earth_haven/features/news/domain/entities/post_entity.dart';
import 'package:earth_haven/features/news/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_snack_bar_message.dart';
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
        //   showSnackBar(context: context, message: 'PostSuccessState');
        //   // postEntity=PostSuccessState.postEntity;
        //   print(PostSuccessState.postEntity.length);
        // }
      },
      builder: (context, state) {
        if(PostSuccessState.postEntity.isNotEmpty ){
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>  PostItem(postEntity: PostSuccessState.postEntity[index]!,),
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 5,
                ),
                itemCount: PostSuccessState.postEntity.length),
          );

        }else{
          return const Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
