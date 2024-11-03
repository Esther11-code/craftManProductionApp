
import 'package:craftmanapp/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/page route/detail/route_name.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, RouteName.notification),
        child: Icon(Icons.notifications_outlined,
            color: Appcolors.white, size: 30.sp));
  }
}
