import 'package:craftmanapp/config/page%20route/page_route.dart';
import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';
import 'package:craftmanapp/features/splash_onboarding/presentation/widgets/exports.dart';
import 'package:flutter/material.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.white,
        body: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: Appcolors.white,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  Image.asset(OnboardingImagesData.onboarding4,
                      fit: BoxFit.contain,
                      height: size.height * 0.55,
                      width: size.width * 0.9),
                  Center(
                      child: AppText(
                          textalign: TextAlign.center,
                          maxline: 2,
                          size: 25,
                          color: Appcolors.blue,
                          fontweight: FontWeight.w700,
                          text:
                              'Finding Service Providers has never been easy')),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                      width: size.width * 0.7,
                      child: AppText(
                          fontweight: FontWeight.w500,
                          color: Appcolors.blue,
                          textalign: TextAlign.center,
                          text:
                              'Find the best doctors that suit your health needs.')),
                  SizedBox(height: size.height * 0.03),
                  Image.asset(OnboardingImagesData.welcome,
                      height: size.height * 0.5, width: size.width * 0.9),
                  SizedBox(height: size.height * 0.1),
                  OnboardButton(
                      ontap: () =>
                          Navigator.pushNamed(context, RouteName.login)),
                ],
              ),
            )),
          ],
        ));
  }
}
