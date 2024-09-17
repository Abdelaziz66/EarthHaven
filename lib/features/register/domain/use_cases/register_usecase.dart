import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/register_model.dart';
import '../repositories/register_repo.dart';

class RegisterUseCase extends UseCase<void,RegisterModel>{
 final RegisterRepo registerRepo;

  RegisterUseCase({required this.registerRepo});
  @override
  Future<Either<Failure, void>> call([RegisterModel? param]) {
  return registerRepo.register(registerModel:param!);
  }

}
