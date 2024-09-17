
import 'package:earth_haven/features/profile/presentation/widgets/user_info.dart';
import 'package:earth_haven/features/profile/presentation/widgets/verify_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/logout.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';
import 'custom_profile_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            key: profileScaffoldKey,
            body: Column(
              children: [
                const UserInfo(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      CustomProfileButton(
                        text: 'Edit Profile',
                        function: () {
                        },
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      CustomProfileButton(
                        text: 'Logout',
                        function: () {
                          clickOnLogout(context);
                        },
                      ),
                    ],
                  ),
                ),
                const VerifyAccount(),
              ],
            ),
          );
        },
      ),
    );
  }



  void clickOnLogout(context) {
    logout(context);
  }
}


