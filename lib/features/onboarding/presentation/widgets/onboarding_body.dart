
import 'package:earth_haven/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/custom_button.dart';
import 'onboarding_item.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  bool isLast = false;
  var smoothPageController = PageController();
  final List title = [
    'Take care of your plant',
    'Making the planet breathe',
    'Share your questions',
  ];
  final List subTitle = [
    'Learn more about your plant through AI.',
    'by sharing your opinions and answers with others.',
    'community to help you optimize your plant.',
  ];
  final List imageName = [
    'onboarding1.png',
    'onboarding2.png',
    'onboarding3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BackGround(
      widget: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                itemBuilder: (context, index) => OnboardingItem(
                    imageName: imageName[index],
                    title: title[index],
                    subTitle: subTitle[index]),
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  _changeInOnboarding(index);
                },
                controller: smoothPageController,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SmoothPageIndicator(
                      controller: smoothPageController,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.white70,
                        activeDotColor: Colors.green,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4,
                      ),
                      count: 3),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                        child: InkWell(
                          onTap: (){
                            _clickOnNext(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: KColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: FaIcon(FontAwesomeIcons.angleRight,color:  KColors.thirdColor,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeInOnboarding(int index) {
    if (index == 2) {
      isLast = true;
    } else {
      isLast = false;
    }
  }

  void _clickOnNext(BuildContext context) {
    if (isLast) {
      save('isOnboarding', true, kStartBox);
      GoRouter.of(context).go(AppRouter.kLoginOrRegister);
    } else {
      smoothPageController.nextPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }
}
