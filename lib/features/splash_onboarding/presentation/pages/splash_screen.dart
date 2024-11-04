import 'package:craftmanapp/config/page%20route/page_route.dart';
import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';
import 'package:craftmanapp/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globalwidget/export.dart';
import '../../../authentication/presentation/bloc/cubit/auth_cubit.dart';
import '../../../authentication/presentation/pages/login_page.dart';
import '../../../booking/presentation/bloc/cubit/booking_cubit.dart';
import '../../../home/presentation/bloc/cubit/home_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<OnboardingCubit>().delaySplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final readHome = context.read<HomeCubit>();

    final size = MediaQuery.sizeOf(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
          if (state is OnboardingLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.firstonboarding, (route) => false);
          }
          if (state is Newuserstate) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.firstonboarding, (route) => false);
          }
          if (state is AutoLoginState) {
            context.read<AuthCubit>().login();
          }
        }),
        BlocListener<AuthCubit, AuthState>(listener: (context, state) {
          if (state is LoginState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.bottomNav, (route) => false);
            Navigator.pushNamed(context, RouteName.successLogin);
            readHome.getCategories();

            readHome.getPopularService();
            readHome.getNotification();
            context.read<BookingCubit>().getbookingHistory();
          }
          if (state is AuthErrorState) {
            Navigator.pushNamed(context, RouteName.login);
          }
        })
      ],
      child: AppScaffold(
          color: Appcolors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: size.height * 0.06),
              Center(
                  child: Image.asset(OnboardingImagesData.welcome,
                      width: size.width)),
              // AnimatedTextKit(
              //     pause: const Duration(seconds: 2),
              //     repeatForever: true,
              //     animatedTexts: [
              //       ColorizeAnimatedText(
              //         'CraftsMan',
              //         textStyle: colorizeTextStyle,
              //         colors: colorizeColors,
              //       )
              //     ],
              //     isRepeatingAnimation: true),
              // context.watch<AuthCubit>().state is AuthLoadingState
              //     ? Column(
              //         children: [
              //           LoadingAnimationWidget.inkDrop(
              //               color: Appcolors.white, size: 25.sp),
              //           SizedBox(height: size.height * 0.013),
              //           AppText(
              //               text: 'Please wait ..',
              //               color: Appcolors.white,
              //               size: 16)
              //         ],
              //       )
              //     : const SizedBox.shrink()
            ],
          )),
    );
  }
}
