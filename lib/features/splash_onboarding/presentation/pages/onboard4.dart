import 'package:craftmanapp/config/page%20route/page_route.dart';
import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';

import 'package:flutter/material.dart';

import '../../../../globalwidget/export.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: size.height * 0.06),
              Image.asset(OnboardingImagesData.onboarding4,
                  fit: BoxFit.contain,
                  height: size.height * 0.55,
                  width: size.width),
              SizedBox(height: size.height * 0.01),
              AppText(
                  textalign: TextAlign.center,
                  maxline: 2,
                  size: 21,
                  color: Appcolors.blackColor,
                  fontweight: FontWeight.w600,
                  text: 'What services do you need?'),
              SizedBox(height: size.height * 0.01),
              AppText(
                  color: Appcolors.blue,
                  textalign: TextAlign.center,
                  text: 'Locate a reliable car repair expert in your area.'),
              SizedBox(height: size.height * 0.035),
              Appbutton(
                  label: 'Get Started',
                  onTap: () => Navigator.pushNamed(context, RouteName.login)),
            ],
          ),
        ],
      ),
    ));
  }
}
