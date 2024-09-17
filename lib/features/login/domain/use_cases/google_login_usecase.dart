import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repo.dart';


class GoogleLoginUseCase extends UseCase<void,NoParam>{
 final LoginRepo loginRepo;


 GoogleLoginUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, LoginEntity>> call([NoParam? param]) {
  return loginRepo.googleLogin();
  }

}
