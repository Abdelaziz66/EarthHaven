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

// class StreamPostListview extends StatelessWidget {
//   const StreamPostListview({super.key});
//
//   @override
//   Widget build(BuildContext context)  {
//     return BlocBuilder<NewsCubit, NewsState>(
//       builder: (context, state) {
//         return StreamBuilder<List<PostEntity>>(
//             stream:  NewsCubit.get(context).getPostStream(),
//
//
//      // The stream of posts
//     builder: (context,AsyncSnapshot<List<PostEntity>> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//     return const Center(child:  LoadingAnimationWidget.staggeredDotsWave(
//           color: Colors.white,
//           size: 70,
//         ));
//     } else if (snapshot.hasError) {
//     return Center(child: Text('Error: ${snapshot.error}'));
//     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//     return const Center(child: Text('No posts found'));
//     }
//
//     // Access the list of PostEntity objects
//     List<PostEntity> posts = snapshot.data!;
//
//     // Build the UI with the posts list
//     return ListView.builder(
//     itemCount: posts.length,
//     itemBuilder: (context, index) {
//     return ListTile(
//     title: Text(
//     posts[index].title), // Assuming PostEntity has a title field
//     subtitle: Text(posts[index]
//         .content), // Assuming PostEntity has a content field
//     );
//     },
//     );
//     },
//     );
//   }
// }
//
// class PostsBuilder extends StatelessWidget {
//   const PostsBuilder({
//     required this.scaffoldKey,
//     super.key});
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PostCubit,PostState>(builder:(context,state){
//       return StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('posts').orderBy('postDate', descending: false)
//               .snapshots(),
//           builder: (BuildContext context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                   child:  LoadingAnimationWidget.staggeredDotsWave(
//           color: Colors.white,
//           size: 70,
//         )); // or any other loading indicator
//             }
//             if(snapshot.hasData){
//               final List<QueryDocumentSnapshot>newData=snapshot.data!.docs;
//               final List<PostModel>newList=[];
//               for(var element in newData){
//                 newList.add(PostModel.fromJson(element.data()as Map<String, dynamic>));
//               }
//               return PostsList(scaffoldKey: scaffoldKey, posts:newList);
//             }
//             if(state is GetPostsSuccessState){
//               return PostsList(scaffoldKey: scaffoldKey, posts:PostCubit.get(context).allPostsList );
//             }else if(state is GetPostsErrorState){
//               return Text(state.errMessage);
//             }else{
//               return const Center(child:  LoadingAnimationWidget.staggeredDotsWave(
//           color: Colors.white,
//           size: 70,
//         ),);
//             }
//           });
//       });}
// }}