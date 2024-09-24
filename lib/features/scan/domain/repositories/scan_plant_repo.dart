import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/check_plant_input_model.dart';
import '../../data/models/plant_model.dart';
import '../entities/plant_entity.dart';



abstract class ScanPlantRepo{

  Future<Either<Failure,PlantInfoEntity>> checkPlant({required CheckPlantInputModel checkPlantInputModel});

}