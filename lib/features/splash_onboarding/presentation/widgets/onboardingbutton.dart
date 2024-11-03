import 'package:craftmanapp/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({super.key, required this.ontap});

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
        child: InkWell(
            onTap: ontap,
            child: CircleAvatar(
                backgroundColor: Appcolors.blackColor,
                radius: size.width * 0.07,
                child: Center(
                    child: Icon(Icons.arrow_forward_ios,
                        size: 25.sp, color: Appcolors.white)))));
  }
}
