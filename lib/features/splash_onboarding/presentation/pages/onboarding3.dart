import 'package:craftmanapp/constants/export.dart';
import 'package:flutter/material.dart';
import '../../../../config/page route/detail/route_name.dart';
import '../../../../globalwidget/export.dart';
import '../../data/local/onboardingimages.dart';
import '../widgets/exports.dart';

class ThirdOnboard extends StatelessWidget {
  const ThirdOnboard({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.06),
              Center(
                  child: Image.asset(OnboardingImagesData.onboarding3,
                      fit: BoxFit.cover,
                      height: size.height * 0.55,
                      width: size.width)),
              SizedBox(height: size.height * 0.01),
              AppText(
                  size: 21,
                  fontweight: FontWeight.w600,
                  color: Appcolors.blackColor,
                  maxline: 2,
                  text: 'What services do you need?'),
              SizedBox(height: size.height * 0.01),
              const AppText(
                  textalign: TextAlign.center,
                  maxline: 4,
                  text:
                      'Get connected with a top-notch cleaning service for your home'),
              SizedBox(height: size.height * 0.035),
              OnboardButton(
                  ontap: () => Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.fourthonboarding, (route) => false))
            ],
          ),
        ));
  }
}
