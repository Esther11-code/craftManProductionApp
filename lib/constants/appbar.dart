import 'package:craftmanapp/globalwidget/export.dart';
import 'package:craftmanapp/globalwidget/widgets/appshadowcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'export.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        children: [
          AppshadowContainer(
            shadowcolour: Appcolors.lightgrey,
            padding: EdgeInsets.all(2.w),
            child: GestureDetector(
                onTap: onTap ?? () => Navigator.pop(context),
                child: Icon(CupertinoIcons.back,
                    size: 25.sp, color: Appcolors.blackColor)),
          ),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Center(
              child: AppText(
                  text: title,
                  fontweight: FontWeight.w600,
                  color: Appcolors.blackColor),
            ),
          ),
          const NotificationIcon()
        ],
      ),
    );
  }
}
