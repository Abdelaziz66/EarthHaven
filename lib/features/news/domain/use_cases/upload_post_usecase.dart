import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repo.dart';

class UploadPostUseCase extends UseCase<void,PostEntity>{
  final PostRepo postRepo;

  UploadPostUseCase({required this.postRepo});
  @override
  Future<Either<Failure, void>> call([PostEntity? postEntity]) async{
    return await postRepo.uploadPost(postEntity: postEntity!);
  }

}