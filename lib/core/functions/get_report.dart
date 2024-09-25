import 'package:go_router/go_router.dart';

import '../../features/scan/domain/entities/plant_entity.dart';
import '../utils/app_router.dart';

void clickOnGetReport(context,plantInfoEntity) {
  // CheckPlantInputModel checkPlantInputModel =
  //     CheckPlantInputModel(images: [
  //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw1ledGakjZaxSd95--Z3PDPdVTy2H5jNgog&s'
  // ]);
  // ScanCubit.get(context)
  //     .checkPlant(checkPlantInputModel: checkPlantInputModel);
  plantInfoEntity = PlantInfoEntity(
      bestLightCondition:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets',
      name: 'Name',
      images:
      'https://img.freepik.com/premium-photo/growth-plants-concept-nature-morning-light-green-background-small-young-plants-green-background-concept-environmental-stewardship-world-environment-day_93314-4817.jpg',
      probability: 99.8,
      description:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets',
      bestSoilType:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets',
      commonUses:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets',
      culturalSignificance:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets',
      toxicity:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets',
      bestWatering:
      'This plant thrives in indirect sunlight and requires moderate watering. It grows best in well-draining soil and can be used for decorative purposes. While generally non-toxic, its advised to keep it away from pets');
  GoRouter.of(context)
      .push(AppRouter.kPlantDetails, extra: plantInfoEntity);
}
