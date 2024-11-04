import 'package:craftmanapp/config/page%20route/page_route.dart';
import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';
import 'package:craftmanapp/globalwidget/export.dart';
import 'package:flutter/material.dart';

import '../widgets/exports.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.06),
          Image.asset(OnboardingImagesData.onboarding1,
              fit: BoxFit.cover, height: size.height * 0.55, width: size.width),
          SizedBox(height: size.height * 0.01),
          AppText(
              textalign: TextAlign.center,
              maxline: 2,
              fontweight: FontWeight.w600,
              color: Appcolors.blackColor,
              size: 21,
              text: 'What services do you need?'),
          SizedBox(height: size.height * 0.01),
          const AppText(
              size: 16,
              textalign: TextAlign.center,
              maxline: 5,
              text: 'Find the best painter to give your home a fresh new look'),
          SizedBox(height: size.height * 0.035),
          OnboardButton(
            ontap: () =>
                Navigator.pushNamed(context, RouteName.secondonboarding),
          ),
        ],
      ),
    ));
  }
}
