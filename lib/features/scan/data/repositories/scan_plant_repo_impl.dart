import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/plant_entity.dart';
import '../../domain/repositories/scan_plant_repo.dart';
import '../data_sources/scan_plant_remote_data_source.dart';
import '../models/check_plant_input_model.dart';
import '../models/plant_model.dart';


class ScanPlantRepoImpl extends ScanPlantRepo{
 final ScanPlantRemoteDataSource scanPlantRemoteDataSource;


 ScanPlantRepoImpl( {required this.scanPlantRemoteDataSource,});

  @override
  Future<Either<Failure, PlantInfoEntity>> checkPlant({required CheckPlantInputModel checkPlantInputModel})async {
    try{
      PlantInfoEntity? plantInfoEntity;
      plantInfoEntity= await scanPlantRemoteDataSource.checkPlant(checkPlantInputModel: checkPlantInputModel);
      return right(plantInfoEntity!);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}