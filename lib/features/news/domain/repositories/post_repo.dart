import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_entity.dart';


abstract class PostRepo{
  Future<Either<Failure, Stream<List<PostEntity>>>> getPost();
  Future<Either<Failure,void>> uploadPost({required PostEntity postEntity});
  Future<Either<Failure,String>> uploadImage({required File postImage});
}