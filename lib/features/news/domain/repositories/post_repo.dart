import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_entity.dart';


abstract class PostRepo{
  Future<Either<Failure, List<PostEntity>>> getPost();
  Future<Either<Failure,void>> uploadPost({required PostEntity postEntity});
  Future<Either<Failure,String>> uploadImage({required File postImage});
  Future<Either<Failure, void>>addLike({required String postId});
  Future<Either<Failure, void>>removeLike({required String postId});
}