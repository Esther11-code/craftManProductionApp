import 'package:craftmanapp/config/page%20route/page_route.dart';
import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';
import 'package:craftmanapp/globalwidget/widgets/appscaffold.dart';
import 'package:craftmanapp/globalwidget/widgets/apptext.dart';
import 'package:flutter/material.dart';

import '../widgets/exports.dart';

class SecondOnboard extends StatelessWidget {
  const SecondOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppScaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.06),
          Image.asset(OnboardingImagesData.onboarding2,
              width: size.width, height: size.height * 0.55, fit: BoxFit.cover),
          SizedBox(height: size.height * 0.01),
          AppText(
              text: 'What services do you need?',
              size: 21,
              color: Appcolors.blackColor,
              fontweight: FontWeight.w600),
          SizedBox(height: size.height * 0.01),
          const AppText(
              textalign: TextAlign.center,
              size: 16,
              maxline: 5,
              text:
                  'Find the best electrician that suit your home electrical needs.'),
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
