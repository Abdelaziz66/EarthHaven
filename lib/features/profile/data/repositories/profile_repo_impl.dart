import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../news/domain/entities/post_entity.dart';
import '../../domain/repositories/profile_repo.dart';
import '../data_sources/profile_remote_data_source.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl({
    required this.profileRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getUserPost() async {
    try {
      List<PostEntity> postEntity;
      postEntity = await profileRemoteDataSource.getUserPost();
      return right(postEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}
