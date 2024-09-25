import 'package:earth_haven/core/functions/setup_service_locator.dart';
import 'package:earth_haven/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:earth_haven/features/profile/domain/use_cases/get_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/profile_cubit.dart';
import '../widgets/profile_body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
          getUserPostUseCase: GetUserPostUseCase(
              profileRepo: getIt.get<ProfileRepoImpl>()))..getUserPost(),
      child: const ProfileBody(),
    );
  }
}
