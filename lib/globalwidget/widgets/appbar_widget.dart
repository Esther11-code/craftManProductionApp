import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../export.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.size, required this.title});

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        children: [
          const AppbackButton(),
          20.horizontalSpace,
          AppText(text: title, fontweight: FontWeight.w500)
        ],
      ),
    );
  }
}
