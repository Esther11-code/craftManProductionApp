import 'package:craftmanapp/globalwidget/widgets/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/appcolors.dart';

class ApptextField extends StatelessWidget {
  const ApptextField(
      {super.key,
      this.title,
      this.prefixIcon,
      this.sufixIcon,
      this.controller,
      this.hintText,
      this.malxLine,
      this.validator,
      this.onChange,
      this.onTap,
      this.readOnly = false,
      this.keyboardType});
  final String? title, hintText;
  final int? malxLine;
  final IconData? prefixIcon, sufixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final Function()? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: title ?? "", size: 14, fontweight: FontWeight.w500),
        2.verticalSpace,
        TextFormField(
            onTap: onTap,
            readOnly: readOnly,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: malxLine,
            controller: controller,
            onChanged: onChange,
            keyboardType: keyboardType,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                errorMaxLines: 3,
                suffixIconColor: WidgetStateColor.resolveWith((states) =>
                    states.contains(WidgetState.focused)
                        ? Appcolors.blackColor
                        : Appcolors.blackColor.withOpacity(0.4)),
                prefixIconColor: WidgetStateColor.resolveWith((states) =>
                    states.contains(WidgetState.focused)
                        ? Appcolors.blackColor
                        : Appcolors.blackColor.withOpacity(0.4)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: const BorderSide(color: Color(0XFFE5E7EB))),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: const BorderSide(color: Color(0XFFE5E7EB))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: Appcolors.blackColor)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: Appcolors.blackColor)),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontFamily: 'Matter',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.blackColor),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
                suffixIcon: sufixIcon == null ? null : Icon(sufixIcon, size: 25.sp),
                prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, size: 25.sp))),
      ],
    );
  }
}
