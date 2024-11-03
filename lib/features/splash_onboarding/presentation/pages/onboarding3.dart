import 'package:craftmanapp/constants/export.dart';
import 'package:flutter/material.dart';
import '../../../../config/page route/detail/route_name.dart';
import '../../data/local/onboardingimages.dart';
import '../widgets/exports.dart';

class ThirdOnboard extends StatelessWidget {
  const ThirdOnboard({super.key});
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
              Center(
                  child: Image.asset(OnboardingImagesData.onboarding3,
                      fit: BoxFit.cover)),
              SizedBox(height: size.height * 0.012),
              AppText(
                  size: 21,
                  fontweight: FontWeight.w600,
                  color: Appcolors.blackColor,
                  maxline: 2,
                  text: 'What services do you need?'),
              SizedBox(height: size.height * 0.016),
              SizedBox(
                  width: size.width,
                  child: const AppText(
                      textalign: TextAlign.center,
                      maxline: 4,
                      text:
                          'Find the best doctors that suit your health needs.')),
              SizedBox(height: size.height * 0.045),
              OnboardButton(
                  ontap: () => Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.fourthonboarding, (route) => false))
            ],
          ),
        ));
  }
}
