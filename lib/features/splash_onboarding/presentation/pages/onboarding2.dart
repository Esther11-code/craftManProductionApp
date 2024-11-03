import 'package:craftmanapp/config/page%20route/page_route.dart';
import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';
import 'package:flutter/material.dart';

import '../widgets/exports.dart';

class SecondOnboard extends StatelessWidget {
  const SecondOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppScaffold(
        color: Appcolors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          width: size.width,
          color: Appcolors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(OnboardingImagesData.onboarding2,
                  width: size.width, fit: BoxFit.cover),
              SizedBox(height: size.height * 0.03),
              AppText(
                  text: 'What services do you need?',
                  size: 21,
                  color: Appcolors.blackColor,
                  fontweight: FontWeight.w600),
              SizedBox(height: size.height * 0.016),
              SizedBox(
                  width: size.width,
                  child: const AppText(
                      textalign: TextAlign.center,
                      size: 16,
                      maxline: 5,
                      text:
                          'Find the best doctors that suit your health needs.')),
              SizedBox(height: size.height * 0.035),
              OnboardButton(
                ontap: () =>
                    Navigator.pushNamed(context, RouteName.thirdonboarding),
              )
            ],
          ),
        ));
  }
}
