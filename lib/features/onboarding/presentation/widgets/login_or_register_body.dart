import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginOrRegisterBody extends StatelessWidget {
  const LoginOrRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const BackGround(
        widget: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Image(),
            _Hello(),
            StyledButton(),
            SizedBox(
              height: 30,
            ),
            // BounceInDown(child: const _CustomButton()),
          ],
        ),
      ),
    ));
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
                'assets/onboarding/o4.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

