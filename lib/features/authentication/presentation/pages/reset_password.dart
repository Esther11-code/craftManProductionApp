import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/authentication/presentation/pages/email_otp.dart';
import 'package:craftmanapp/globalwidget/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/page route/page_route.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        body: Column(
      children: [
        AppbarWidget(size: size, title: 'Reset Password'),
        20.verticalSpace,
        Expanded(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          children: [
            const AppText(
                text: 'Secure your account',
                fontweight: FontWeight.w600,
                size: 20),
            5.verticalSpace,
            const AppText(
                text: 'Create a new password below to secure your account',
                size: 14),
            20.verticalSpace,
            const ApptextField(
                title: 'New Password', hintText: 'Enter New Password'),
            15.verticalSpace,
            const ApptextField(
                title: 'Confirm Password', hintText: 'Enter confirm Password'),
            20.verticalSpace,
            const CustomOtpField(),
            10.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Didn’t receive any code?', size: 14),
                AppText(text: 'Expires in 00:00', size: 14),
              ],
            ),
            5.verticalSpace,
            const AppText(
                text: 'Resend code', fontweight: FontWeight.w500, size: 14),
            40.verticalSpace,
            Appbutton(
                label: 'Proceed',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ResetPasswordDialog();
                      });
                })
          ],
        ))
      ],
    ));
  }
}

class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      backgroundColor: Appcolors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(CupertinoIcons.check_mark_circled_solid, size: 250.sp),
          20.verticalSpace,
          const AppText(
              textalign: TextAlign.center,
              text: 'Your Password Has been Changed Successfully!',
              size: 16),
          20.verticalSpace,
          Appbutton(
              label: 'Done',
              onTap: () {
                Navigator.pushNamed(context, RouteName.login);
              })
        ],
      ),
    );
  }
}
