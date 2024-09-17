import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/background.dart';

class LoginOrRegisterBody extends StatelessWidget {
  const LoginOrRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BackGround(
        widget: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _Image(),
            const _Hello(),
            BounceInDown(child: const _CustomButton()),
          ],
        ),
      ),
    ));
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 600
          ? MediaQuery.of(context).size.width
          : 600,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kRegister);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20),
                      color: Colors.white.withOpacity(.4),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text('Register', style: Styles.textStyle20),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLogin);
                  },
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text('Login', style: Styles.textStyle20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hello extends StatelessWidget {
  const _Hello();

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: FadeInDown(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello Again!', style: Styles.onboardingTitle),
            SizedBox(
              height: 20,
            ),
            Text(
              'You can skip Register and Login',
              style: Styles.onboardingSubTitle,
            ),
          ],
        ),
      ),
    ));
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      child: AspectRatio(
        aspectRatio: .8 / 1,
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FadeInDown(
              child: Image.asset(
                'assets/onboarding/onboarding2.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

