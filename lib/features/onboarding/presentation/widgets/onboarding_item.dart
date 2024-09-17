import 'package:flutter/material.dart';

import '../../../../core/style/textStyles.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.imageName,
    required this.title,
    required this.subTitle,
  });

  final String imageName;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        _Image(imageName: imageName),
        const SizedBox(
          height: 30,
        ),
        _Title(title: title),
        const SizedBox(
          height: 20,
        ),
        _SubTitle(subTitle: subTitle),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: Styles.onboardingSubTitle,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: Styles.onboardingTitle,
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.imageName,
  });

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      child: AspectRatio(
        aspectRatio: .8 / 1,
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/onboarding/$imageName',
            ),
          ),
        ),
      ),
    );
  }
}
