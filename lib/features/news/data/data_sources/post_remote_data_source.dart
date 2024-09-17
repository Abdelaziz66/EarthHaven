import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_haven/features/news/presentation/manager/news_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/constants/constant.dart';
import '../../domain/entities/post_entity.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostEntity>> getPost();
  Future<void> uploadPost({required PostEntity postEntity});
  Future<String> uploadImage({required File postImage});
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  @override
  Future<List<PostEntity>> getPost() async {
    List<PostEntity> postEntity = [];
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) async {
      postEntity = _getPostList(event);
      PostSuccessState.set(postEntity: postEntity);
    });

    return postEntity;
  }

  @override
  Future<void> uploadPost({required PostEntity postEntity}) async {
    PostModel postModel = PostModel(
        userName: postEntity.userName,
        uId: uId,
        caption: postEntity.caption,
        tag: postEntity.tag,
        postId: postEntity.postId,
        userProfileImage: postEntity.userProfileImage,
        date: postEntity.date,
        image: postEntity.image);
    await FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value) {});
  }

  List<PostEntity> _getPostList(QuerySnapshot<Map<String, dynamic>> value) {
    List<PostEntity> postEntity = [];
    for (int i = 0; i < value.docs.length; i++) {
      postEntity.add(PostModel.fromJson(value.docs[i].data()));
    }
    return postEntity;
  }

  @override
  Future<String> uploadImage({required File postImage}) async {
    String? imageURL;
    await FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) async => await value.ref.getDownloadURL().then((value) {
              imageURL = value;
            }));
    return imageURL!;
  }
}
