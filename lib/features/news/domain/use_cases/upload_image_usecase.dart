import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repo.dart';

class UploadImageUseCase extends UseCase<String,File>{
  final PostRepo postRepo;

  UploadImageUseCase({required this.postRepo});
  @override
  Future<Either<Failure, String>> call([File? postImage]) async{
    return await postRepo.uploadImage(postImage: postImage!);
  }

}