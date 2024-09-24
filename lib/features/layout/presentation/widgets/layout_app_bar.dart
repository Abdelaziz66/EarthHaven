import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 18,),
              const Text('EarthHaven',style:TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w600
              ),),
              const Spacer(),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kAddPostScreen);
                },
                icon: const Icon(Icons.add_photo_alternate_outlined,color: Colors.white,),
              ),
              IconButton(
                onPressed: () {
                  showSnackBar(message: 'coming soon :)', context: context);

                },
                icon: const Icon(Icons.notifications,color: Colors.white,),
              ),
              const SizedBox(width: 10,),
            ],
          ),
        ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => layoutScaffoldKey.currentState?.openDrawer(),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 20),
        child: SizedBox(
          width: 38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 2.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 7),
              Container(
                width: 20,
                height: 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
