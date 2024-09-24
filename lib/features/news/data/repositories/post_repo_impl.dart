import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repo.dart';
import '../data_sources/post_remote_data_source.dart';

class PostRepoImpl extends PostRepo {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepoImpl({
    required this.postRemoteDataSource,
  });

  @override
  Future<Either<Failure, Stream<List<PostEntity>>>> getPost() async {
    try {
      Stream<List<PostEntity>> postEntity;
      postEntity = await postRemoteDataSource.getPost();
      print(postEntity.length);
      return right(postEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadPost(
      {required PostEntity postEntity}) async {
    try {
      await postRemoteDataSource.uploadPost(postEntity: postEntity);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage({required File postImage})async {
    try {
      String imageURL;
      imageURL= await postRemoteDataSource.uploadImage(postImage: postImage);
      return right(imageURL);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
