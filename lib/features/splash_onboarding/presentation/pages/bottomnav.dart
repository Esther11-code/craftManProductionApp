import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboard_static_repo.dart';
import 'package:craftmanapp/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:craftmanapp/globalwidget/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final watchOnboarding = context.watch<OnboardingCubit>();
    final readOnboarding = context.read<OnboardingCubit>();

    return Scaffold(
        body: watchOnboarding.screens[watchOnboarding.bottonnavSelectedIndex],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppshadowContainer(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4,
                      (index) => GestureDetector(
                            onTap: () {
                              readOnboarding.changebottomnavindex(index: index);
                            },
                            child: Column(
                              children: [
                                Icon(
                                    OnboardStaticRepo
                                        .bottomNavItems[index].icon,
                                    size: 30.sp,
                                    color: watchOnboarding
                                                .bottonnavSelectedIndex ==
                                            index
                                        ? Appcolors.blackColor
                                        : Appcolors.lightgrey),
                                Visibility(
                                  visible:
                                      watchOnboarding.bottonnavSelectedIndex ==
                                          index,
                                  child: AppText(
                                      text: OnboardStaticRepo
                                          .bottomNavItems[index].title,
                                      fontweight: FontWeight.w500,
                                      size: 14,
                                      color: Appcolors.blackColor),
                                )
                              ],
                            ),
                          ))),
            ),
          ],
        ));
  }
}
