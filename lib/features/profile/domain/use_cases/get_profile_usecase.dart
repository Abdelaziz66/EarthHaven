import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../news/domain/entities/post_entity.dart';
import '../repositories/profile_repo.dart';


class GetUserPostUseCase extends UseCase< List<PostEntity>,NoParam>{
 final  ProfileRepo profileRepo;

 GetUserPostUseCase({required this.profileRepo});
 @override
 Future<Either<Failure, List<PostEntity>>> call([NoParam? param])async {
  return await profileRepo.getUserPost();
 }

}