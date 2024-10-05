import 'dart:io';

import 'package:earth_haven/features/scan/presentation/manager/scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/functions/get_report.dart';
import '../../data/models/check_plant_input_model.dart';
import '../../domain/entities/plant_entity.dart';
import '../../domain/use_cases/check_plant_usecase.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit({required this.checkPlantUseCase })
      : super(ScanInitial());
  static ScanCubit get(context) => BlocProvider.of(context);


  final CheckPlantUseCase checkPlantUseCase;

  void checkPlant({required CheckPlantInputModel checkPlantInputModel}) async {
    emit(CheckPlantLoadingState());
    var result = await checkPlantUseCase.call(checkPlantInputModel);
    result.fold((failure) {
      print(failure.message);
      emit(CheckPlantErrorState(failure.toString()));
    }, (right) {
      emit(CheckPlantSuccessState(plantInfoEntity:right));
    });
  }

  void scanPlant({required context}) async {
    emit(CheckPlantLoadingState());
    await clickOnGetReport(context).then((onValue){
      emit(CheckPlantSuccessState(plantInfoEntity:onValue));
    }).catchError((onError){
      emit(CheckPlantErrorState(onError.toString()));
    });
  }

  var picker = ImagePicker();
  File? postImage;
  Future<void> pickImage({required ImageSource imageSource}) async {
    final pickedFile = await picker.pickImage(source:imageSource);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(ImagePickedSuccessState(postImage:postImage));
    }
  }


}
