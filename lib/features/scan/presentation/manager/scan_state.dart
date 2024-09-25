import 'dart:io';

import '../../data/models/plant_model.dart';
import '../../domain/entities/plant_entity.dart';

abstract class ScanState {}

class ScanInitial extends ScanState {}

class CheckPlantLoadingState extends ScanState {}

class CheckPlantSuccessState extends ScanState {
  final PlantInfoEntity plantInfoEntity;

  CheckPlantSuccessState({required this.plantInfoEntity});
}

class CheckPlantErrorState extends ScanState {
  final String errMessage;

  CheckPlantErrorState(this.errMessage);
}



class ImagePickedSuccessState extends ScanState {
  final  File? postImage;

  ImagePickedSuccessState({required this.postImage});

}