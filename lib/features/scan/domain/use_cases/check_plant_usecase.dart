


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

import '../../data/models/check_plant_input_model.dart';
import '../../data/models/plant_model.dart';
import '../entities/plant_entity.dart';
import '../repositories/scan_plant_repo.dart';

class CheckPlantUseCase extends UseCase<PlantInfoEntity, CheckPlantInputModel> {
  final ScanPlantRepo scanPlantRepo;

  CheckPlantUseCase({required this.scanPlantRepo});
  @override
  Future<Either<Failure, PlantInfoEntity>> call([CheckPlantInputModel? checkPlantInputModel]) {
    return scanPlantRepo.checkPlant(checkPlantInputModel:checkPlantInputModel!);
  }
}
