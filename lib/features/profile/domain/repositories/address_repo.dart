import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/address_entity.dart';


abstract class AddressRepo{
  Future<Either<Failure,List<AddressEntity>>> getAddress();
  Future<Either<Failure,void>> uploadAddress({required AddressEntity addressEntity});
}