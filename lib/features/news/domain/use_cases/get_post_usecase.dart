import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repo.dart';

class GetPostUseCase extends UseCase<List<PostEntity>,NoParam>{
 final  PostRepo postRepo;

  GetPostUseCase({required this.postRepo});
  @override
  Future<Either<Failure, List<PostEntity>>> call([NoParam? param])async {
   return await postRepo.getPost();
  }

}