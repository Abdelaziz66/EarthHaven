import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/login_model.dart';
import '../entities/login_entity.dart';

abstract class LoginRepo{

  Future<Either<Failure,LoginEntity>> login({required LoginDataModel loginDataModel,});
  Future<Either<Failure,LoginEntity>> googleLogin();
}