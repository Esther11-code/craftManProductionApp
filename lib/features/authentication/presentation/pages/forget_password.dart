import 'package:craftmanapp/config/page%20route/detail/route_name.dart';
import 'package:craftmanapp/globalwidget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppbarWidget(size: size, title: 'Forgot Password'),
        20.verticalSpace,
        Expanded(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          children: [
            const AppText(text: 'Oops!', fontweight: FontWeight.w600, size: 20),
            10.verticalSpace,
            const AppText(
                text:
                    'Dealing with passwords can be a hassle sometimes, don’t worry it’s going to be a simple fix.',
                size: 14),
            5.verticalSpace,
            const AppText(
                text:
                    'Please enter your email address. We’ll send a six digit code to reset your password.',
                size: 14),
            20.verticalSpace,
            const ApptextField(
                title: 'Email Address',
                hintText: 'Enter email',
                prefixIcon: Icons.email),
            40.verticalSpace,
            Appbutton(
                label: 'Proceed',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.resetPassword);
                })
          ],
        ))
      ],
    ));
  }
}
