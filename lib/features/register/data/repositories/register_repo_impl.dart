import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/register_repo.dart';
import '../data_sources/register_remote_data_source.dart';
import '../models/register_model.dart';

class RegisterRepoImpl extends RegisterRepo {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepoImpl({
    required this.registerRemoteDataSource,
  });

  @override
  Future<Either<Failure, void>> register(
      {required RegisterModel registerModel}) async {
    try {
      await registerRemoteDataSource.register(registerModel: registerModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
