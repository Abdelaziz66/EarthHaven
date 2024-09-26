import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/features/profile/presentation/widgets/user_info.dart';
import 'package:earth_haven/features/profile/presentation/widgets/user_posts_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/logout.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';
import 'custom_profile_button.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  int? postsNumber;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is PostSuccessState){}
        postsNumber=PostSuccessState.postEntity.length;


      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          key: profileScaffoldKey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfo(postsNumber:postsNumber),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CustomProfileButton(
                      text: 'Edit Profile',
                      function: () {},
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
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Text('Your Posts Here!', style: Styles.textStyle16,),
              ),
              const UserPostListview(),
            ],
          ),
        );
      },
    );
  }

  void clickOnLogout(context) {
    logout(context);
  }
}


