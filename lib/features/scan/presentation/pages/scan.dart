import 'package:animate_do/animate_do.dart';
import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:earth_haven/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../data/repositories/scan_plant_repo_impl.dart';
import '../../domain/entities/plant_entity.dart';
import '../../domain/use_cases/check_plant_usecase.dart';
import '../manager/scan_cubit.dart';
import '../manager/scan_state.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  PlantInfoEntity? plantInfoEntity;
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
            showSnackBar(context: context, message: 'CheckPlantSuccessState');
            GoRouter.of(context)
                .push(AppRouter.kPlantDetails, extra: plantInfoEntity);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                const CustomTextHeaderShape(),
                SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Select From !',
                            style: Styles.textStyle20,
                          ),
                          const Spacer(),
                          Image.asset('assets/images/plant1.png'),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      height: 160,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: const GlassBox(
                                  widget: Center(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.image,
                                        color: Colors.white70,
                                        size: 75,
                                      ),
                                      Text(
                                        'Image',
                                        style: Styles.textStyle18,
                                      ),
                                    ],
                                  )),
                                  color: Colors.white10,
                                  borderRadius: 25,
                                  x: 100,
                                  y: 100,
                                  border: true),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: const GlassBox(
                                  widget: Center(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.camera,
                                        color: Colors.white70,
                                        size: 75,
                                      ),
                                      Text(
                                        'Camera',
                                        style: Styles.textStyle18,
                                      ),
                                    ],
                                  )),
                                  color: Colors.white10,
                                  borderRadius: 25,
                                  x: 100,
                                  y: 100,
                                  border: true),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
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
                    },
                    child: const GlassBox(
                        widget: Center(
                            child:Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Get Report',style: Styles.textStyle18,),
                            ),
                        ),
                        color: Colors.white10,
                        borderRadius: 20,
                        x: 100,
                        y: 100,
                        border: true),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomTextHeaderShape extends StatelessWidget {
  const CustomTextHeaderShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: const Padding(
        padding: EdgeInsets.only(left: 15.0, bottom: 10, top: 30, right: 15),
        child: SizedBox(
          height: 130,
          child: GlassBoxWithCustomBorder(
              widget: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.seedling,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            'Upload image and get your report!',
                            style: Styles.textStyle17,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.expand,
                          color: Colors.white70,
                          size: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            'you can Scan your plant or Select image from images.',
                            maxLines: 2,
                            style: Styles.textStyle14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              color: Colors.white10,
              borderRadius: 30,
              x: 150,
              y: 150,
              border: true),
        ),
      ),
    );
  }
}
