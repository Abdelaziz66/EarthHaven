import 'package:animate_do/animate_do.dart';
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/features/profile/presentation/widgets/user_posts.dart';
import 'package:earth_haven/features/profile/presentation/widgets/verify_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../news/domain/entities/post_entity.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';

class UserPostListview extends StatefulWidget {
  const UserPostListview({super.key});

  @override
  State<UserPostListview> createState() => _UserPostListviewState();
}

class _UserPostListviewState extends State<UserPostListview> {
  List<PostEntity?> postEntity=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is PostSuccessState){}
        postEntity=PostSuccessState.postEntity;
        if(FirebaseAuth.instance.currentUser?.emailVerified ==
            true){
          verifyNotify(context);
        }

      },
      builder: (context, state) {
        if (postEntity.isNotEmpty) {
          return Expanded(
            child: FadeInUp(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => UserPostItem(
                    userPostEntity: postEntity[index]!,
                  ),
                  itemCount: PostSuccessState.postEntity.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5
                  ),
                ),
              ),
            ),
          );
        } else if (postEntity.isEmpty &&
            state is PostLoadingState) {
          return Expanded(
              child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
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
