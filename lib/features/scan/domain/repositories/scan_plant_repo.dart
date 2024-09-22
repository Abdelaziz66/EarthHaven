import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../../data/models/checkPlant_input_model.dart';
import '../entities/checkPlant_card_entity.dart';

abstract class CheckPlantRepo{

  Future<Either<Failure,List<CheckPlantCardEntity>>> getCheckPlantCard();
  Future<Either<Failure,void>> checkPlant({required CheckPlantInputModel checkPlantInputModel});

}