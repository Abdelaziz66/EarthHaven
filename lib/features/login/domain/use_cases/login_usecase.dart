import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/login_model.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repo.dart';

class LoginUseCase extends UseCase<void, LoginDataModel> {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});
  @override
  Future<Either<Failure, LoginEntity>> call([LoginDataModel? param]) {
    return loginRepo.login(loginDataModel: param!);
  }
}
