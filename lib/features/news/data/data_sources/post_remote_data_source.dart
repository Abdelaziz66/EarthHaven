import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/get_likes.dart';
import '../../domain/entities/post_entity.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostEntity>> getPost();
  Future<void> uploadPost({required PostEntity postEntity});
  Future<String> uploadImage({required File postImage});
  Future<void> addLike({required String postId});
  Future<void> removeLike({required String postId});
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {

  @override
  Future<List<PostEntity>> getPost() async {
    List<PostEntity> postEntity = [];
    await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date', descending: true)
        .get()
        .then((value) async {
      postEntity = _getPostList(value);
      // setPosts(postEntity: postEntity);
      postEntity=await getLikes(postEntity: postEntity);


      return postEntity;
    });
    return postEntity;

  }

  @override
  Future<void> uploadPost({required PostEntity postEntity}) async {
    final postId = const Uuid().v4();
    PostModel postModel = PostModel(
        userName: postEntity.userName,
        uId: uId,
        caption: postEntity.caption,
        tag: postEntity.tag,
        postId: postId,
        userProfileImage: postEntity.userProfileImage,
        date: postEntity.date,
        image: postEntity.image);
    await FirebaseFirestore.instance
        .collection('posts').doc(postId)
        .set(postModel.toMap())
        .then((value) {});
    await FirebaseFirestore.instance
        .collection('users').doc(uId).collection('posts').doc(postId)
        .set(postModel.toMap())
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

  @override
  Future<void> addLike({required String postId})async {

    Map<String,dynamic> data = {
      'postId':postId,
      'uId':uId,
      'like':true,
    };

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId).collection('likes').doc(uId)
        .set(data);
  }

  @override
  Future<void> removeLike({required String postId}) async{
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId).collection('likes').doc(uId).delete();
  }



}
