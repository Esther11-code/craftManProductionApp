import 'package:craftmanapp/config/page%20route/detail/route_name.dart';
import 'package:craftmanapp/constants/appcolors.dart';
import 'package:craftmanapp/globalwidget/widgets/appbutton.dart';
import 'package:craftmanapp/globalwidget/widgets/appscaffold.dart';
import 'package:craftmanapp/globalwidget/widgets/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_user,
                size: 300.sp, color: Appcolors.blackColor),
            SizedBox(height: size.width * 0.055),
            const AppText(
                text: 'Account Logged In',
                size: 20,
                fontweight: FontWeight.w600),
            SizedBox(height: size.width * 0.02),
            const AppText(
                text: 'Your account has been successfully Logged In ',
                size: 16,
                textalign: TextAlign.center),
            40.verticalSpace,
            Appbutton(
              onTap: () {
                Navigator.pushNamed(context, RouteName.bottomNav);
              },
              label: 'Proceed',
            ),
            SizedBox(height: size.width * 0.05),
          ],
        ),
      ),
    );
  }
}
