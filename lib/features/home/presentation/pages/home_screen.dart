import 'package:craftmanapp/constants/appcolors.dart';
import 'package:craftmanapp/globalwidget/widgets/appshadowcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/page route/page_route.dart';
import '../../../../globalwidget/export.dart';
import '../widget/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HomeAppbar(size: size),
      SizedBox(height: size.height * 0.025),
      const AppDivider(),
      SizedBox(height: size.height * 0.02),
      HomeCarousel(size: size),
      10.verticalSpace,
      Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: const ApptextField(
            size: 21,
              title: 'What services do you need?',
              prefixIcon: Icons.search,
              hintText: 'Search what you need')),
      10.verticalSpace,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const AppText(
            text: 'Services',
            fontweight: FontWeight.w500,
            size: 21,
          ),
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteName.categories),
              child: const AppText(text: 'View All', size: 16))
        ]),
      ),
      10.verticalSpace,
      HomeService(size: size),
    ]));
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppshadowContainer(
      color: Colors.transparent,
      radius: 1000.r,
      shadowcolour: Appcolors.lightgrey,
      child: Divider(
        color: Appcolors.blackColor.withOpacity(0.1),
        thickness: 2.0,
        height: 6.0,
      ),
    );
  }
}
