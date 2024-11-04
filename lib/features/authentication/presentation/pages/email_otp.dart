import 'package:craftmanapp/config/page%20route/detail/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../constants/appcolors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../constants/craftman_timer.dart';
import '../../../../globalwidget/export.dart';

import '../bloc/cubit/auth_cubit.dart';

class EmailOtp extends StatelessWidget {
  const EmailOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchAuthCubit = context.watch<AuthCubit>();
    final readAuthCubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthEmailVerifiedState) {}
      },
      child: AppScaffold(
        isloading: watchAuthCubit.state is AuthLoadingState,
        body: Column(children: [
          AppbarWidget(size: size, title: 'Email Verification'),
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            children: [
              20.verticalSpace,
              AppText(
                  size: 16,
                  color: Appcolors.blue,
                  text:
                      'We’ve sent an Email containing a six digit code to johndoe****com'),
              5.verticalSpace,
              AppText(
                  text: 'Enter OTP here to proceed',
                  size: 16,
                  color: Appcolors.blue),
              SizedBox(height: size.height * 0.03),
              CustomOtpField(controller: watchAuthCubit.otpController),
              SizedBox(height: size.height * 0.035),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                AppText(
                    size: 14,
                    text: 'Didn’t receive any code?',
                    color: Appcolors.blue),
                Visibility(
                  visible: watchAuthCubit.showTimer,
                  child: Row(children: [
                    AppText(
                        size: 14,
                        text: 'Expires in  ',
                        color: Appcolors.orange),
                    CraftmanTimer(
                        onEnd: () => readAuthCubit.changeShowTimer(),
                        duration: 15,
                        timerColor: Appcolors.orange)
                  ]),
                )
              ]),
              3.verticalSpace,
              GestureDetector(
                  onTap: watchAuthCubit.showTimer
                      ? () => Fluttertoast.showToast(msg: 'Please wait timer')
                      : () {
                          readAuthCubit.changeShowTimer();
                          readAuthCubit.resendEmailOtp();
                        },
                  child: AppText(
                      fontweight: FontWeight.w700,
                      size: 14,
                      text: 'Resend',
                      color: Appcolors.blue)),
              SizedBox(height: size.height * 0.08),
              Appbutton(
                  isLoading: watchAuthCubit.state is AuthLoadingState,
                  width: size.width,
                  height: size.width * 0.13,
                  onTap: () {
                    // readAuthCubit.verifyEmail();
                    Navigator.pushNamed(context, RouteName.bottomNav);
                  },
                  label: 'Proceed'),
              SizedBox(height: size.height * 0.04),
            ],
          ))
        ]),
      ),
    );
  }
}

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PinCodeTextField(
        keyboardType: TextInputType.number,
        controller: controller,
        pinTheme: PinTheme(
            activeColor: Appcolors.blackColor,
            inactiveColor: Appcolors.lightgrey,
            selectedColor: Appcolors.blackColor,
            borderRadius: BorderRadius.circular(size.width * 0.03),
            shape: PinCodeFieldShape.box,
            fieldHeight: size.height * 0.06,
            fieldWidth: size.height * 0.06),
        appContext: context,
        length: 6);
  }
}
