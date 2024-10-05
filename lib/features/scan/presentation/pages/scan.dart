import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../data/repositories/scan_plant_repo_impl.dart';
import '../../domain/entities/plant_entity.dart';
import '../../domain/use_cases/check_plant_usecase.dart';
import '../manager/scan_cubit.dart';
import '../manager/scan_state.dart';
import '../widgets/get_report.dart';
import '../widgets/image_or_camera.dart';
import '../widgets/scan_header.dart';
import '../widgets/select_from.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  PlantInfoEntity? plantInfoEntity;
   File? postImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanCubit(
          checkPlantUseCase:
              CheckPlantUseCase(scanPlantRepo: getIt.get<ScanPlantRepoImpl>())),
      child: BlocConsumer<ScanCubit, ScanState>(
        listener: (context, state) {
          if (state is CheckPlantSuccessState) {
            plantInfoEntity = state.plantInfoEntity;
            GoRouter.of(context)
                .push(AppRouter.kPlantDetails, extra: plantInfoEntity);
          }
          if (state is ImagePickedSuccessState) {
            postImage = state.postImage;
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                const CustomTextHeaderShape(),
                const SelectFrom(),
                ImageOrCamera(postImage: postImage, state: state,),
                ConditionalBuilder(
                  condition: state is CheckPlantLoadingState,
                  builder: (context) =>  LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 70,
                  ),
                  fallback:(context) => GetReport(plantInfoEntity: plantInfoEntity),
                ),


              ],
            ),
          );
        },
      ),
    );
  }

}



