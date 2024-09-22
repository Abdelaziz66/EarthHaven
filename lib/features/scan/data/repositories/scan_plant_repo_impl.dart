import 'package:dartz/dartz.dart';
import 'package:earth_haven/features/checkPlant/data/models/checkPlant_input_model.dart';
import 'package:earth_haven/features/checkPlant/domain/entities/checkPlant_card_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/checkPlant_repo.dart';
import '../data_sources/checkPlant_remote_data_source.dart';

class CheckPlantRepoImpl extends CheckPlantRepo{
 final CheckPlantRemoteDataSource checkPlantRemoteDataSource;


 CheckPlantRepoImpl( {required this.checkPlantRemoteDataSource,});

  @override
  Future<Either<Failure, List<CheckPlantCardEntity>>> getCheckPlantCard() async {
    try{
      List<CheckPlantCardEntity> checkPlantCardEntity =await checkPlantRemoteDataSource.getCheckPlantCard();
      return right(checkPlantCardEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkPlant({required CheckPlantInputModel checkPlantInputModel})async {
    try{
     await checkPlantRemoteDataSource.checkPlant(checkPlantInputModel: checkPlantInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}