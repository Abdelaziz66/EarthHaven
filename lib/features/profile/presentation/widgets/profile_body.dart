
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/features/profile/presentation/widgets/user_info.dart';
import 'package:earth_haven/features/profile/presentation/widgets/user_posts_listview.dart';
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
     return Scaffold(
      backgroundColor: Colors.transparent,
      key: profileScaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const Padding(
            padding: EdgeInsets.only(left: 20.0,top: 10),
            child: Text('Your Posts Here!',style: Styles.textStyle16,),
          ),
          const UserPostListview(),
        ],
      ),
    );
  }



  void clickOnLogout(context) {
    logout(context);
  }
}


