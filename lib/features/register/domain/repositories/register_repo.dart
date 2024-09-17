import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/register_model.dart';

abstract class RegisterRepo{
  Future<Either<Failure,void>> register({required RegisterModel registerModel});
}