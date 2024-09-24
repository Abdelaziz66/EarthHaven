import 'package:earth_haven/core/utils/api_service.dart';
import '../../domain/entities/plant_entity.dart';
import '../models/check_plant_input_model.dart';
import '../models/plant_model.dart';

abstract class ScanPlantRemoteDataSource {
  Future<PlantInfoEntity?> checkPlant(
      {required CheckPlantInputModel checkPlantInputModel});
}

class ScanPlantRemoteDataSourceImpl extends ScanPlantRemoteDataSource {
  @override
  Future<PlantInfoEntity> checkPlant(
      {required CheckPlantInputModel checkPlantInputModel}) async {
    PlantInfoEntity? plantInfoEntity;
    ApiService apiService = ApiService();
    await apiService
        .post(
            endPoint:
                'api/v3/identification?details=common_names,url,description,taxonomy,rank,gbif_id,inaturalist_id,image,synonyms,edible_parts,watering,best_light_condition,best_soil_type,common_uses,cultural_significance,toxicity,best_watering',
            data: checkPlantInputModel.toMap())
        .then((onValue) async {
      plantInfoEntity = await setPlantDataFunction(value: onValue);
      return plantInfoEntity;
    });
    return plantInfoEntity!;
  }




  Future<PlantInfoEntity> setPlantDataFunction({required dynamic value}) async {
    PlantInfoModel plantInfoModel;
    plantInfoModel = PlantInfoModel.fromJson(value.data);
    final Suggestion? suggestions =
    plantInfoModel.result?.classification?.suggestions![0];

    PlantInfoEntity plantInfoEntity = PlantInfoEntity(
      bestLightCondition: suggestions?.details?.bestLightCondition,
      images: plantInfoModel.input?.images![0],
      name: suggestions?.name,
      probability: suggestions?.probability,
      description: suggestions?.details?.description?.value,
      bestSoilType: suggestions?.details?.bestSoilType,
      commonUses: suggestions?.details?.commonUses,
      bestWatering: suggestions?.details?.bestWatering,
      culturalSignificance: suggestions?.details?.culturalSignificance,
      toxicity: suggestions?.details?.toxicity,
    );
    return plantInfoEntity;
  }
}
