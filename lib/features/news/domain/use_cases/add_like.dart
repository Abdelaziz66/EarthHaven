import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repositories/post_repo.dart';


class AddLikeUseCase extends UseCase<void,String>{
  final PostRepo postRepo;
  AddLikeUseCase({required this.postRepo});

  @override
  Future<Either<Failure, void>> call([String? postId])async {
    return postRepo.addLike(postId: postId!);
  }

}