
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../news/domain/entities/post_entity.dart';


abstract class ProfileRepo{
  Future<Either<Failure, List<PostEntity>>> getUserPost();

}