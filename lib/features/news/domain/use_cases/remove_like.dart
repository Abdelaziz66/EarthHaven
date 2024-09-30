import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repositories/post_repo.dart';


class RemoveLikeUseCase extends UseCase<void,String>{
  final PostRepo postRepo;
  RemoveLikeUseCase({required this.postRepo});

  @override
  Future<Either<Failure, void>> call([String? postId])async {
    return postRepo.removeLike(postId: postId!);
  }

}