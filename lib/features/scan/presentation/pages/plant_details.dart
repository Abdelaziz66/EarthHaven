import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../data/models/check_plant_input_model.dart';
import '../../data/repositories/scan_plant_repo_impl.dart';
import '../../domain/use_cases/check_plant_usecase.dart';
import '../manager/scan_cubit.dart';
import '../manager/scan_state.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanCubit(
          checkPlantUseCase:
              CheckPlantUseCase(scanPlantRepo: getIt.get<ScanPlantRepoImpl>())),
      child: BlocConsumer<ScanCubit, ScanState>(
        listener: (context, state) {
          if (state is CheckPlantSuccessState) {
            showSnackBar(context: context, message: 'CheckPlantSuccessState');
          }
        },
        builder: (context, state) {
          return Center(
            child: GestureDetector(
              onTap: () {
                CheckPlantInputModel checkPlantInputModel =
                    CheckPlantInputModel(images: [
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw1ledGakjZaxSd95--Z3PDPdVTy2H5jNgog&s'
                ]);
                ScanCubit.get(context)
                    .checkPlant(checkPlantInputModel: checkPlantInputModel);
              },
              child: Container(
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('scan'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
