


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/checkPlant_input_model.dart';
import '../repositories/checkPlant_repo.dart';

class SendMessageUseCase extends UseCase<void, CheckPlantInputModel> {
  final CheckPlantRepo checkPlantRepo;

  SendMessageUseCase({required this.checkPlantRepo});
  @override
  Future<Either<Failure, void>> call([CheckPlantInputModel? checkPlantInputModel]) {
    return checkPlantRepo.sendMessage(checkPlantInputModel:checkPlantInputModel!);
  }
}
