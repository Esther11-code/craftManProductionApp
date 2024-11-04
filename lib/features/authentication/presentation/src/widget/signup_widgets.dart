import 'package:craftmanapp/config/page%20route/detail/route_name.dart';
import 'package:craftmanapp/features/authentication/data/local/auth_validator.dart';
import 'package:craftmanapp/globalwidget/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/export.dart';
import '../../bloc/cubit/auth_cubit.dart';
import '../auth_widgets_export.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, this.formKey});
  final formKey;

  @override
  Widget build(BuildContext context) {
    final watchAuthCubit = context.watch<AuthCubit>();
    final size = MediaQuery.sizeOf(context);
    return Appbutton(
        isLoading: context.watch<AuthCubit>().state is AuthLoadingState,
        width: size.width,
        height: size.width * 0.13,
        onTap: () {
          // formKey.currentState.validate() &&
          //     watchAuthCubit.agreetoterms &&
          //     watchAuthCubit.firstNameController.text.length >= 3 &&
          //     watchAuthCubit.lastNameController.text.length >= 3;
          // // ? context.read<AuthCubit>().firebaseSendToken()
          // // :
          // ToastMessage.showErrorToast(message: 'Agree to terms');
          Navigator.pushNamed(context, RouteName.emailotp);
        },
        child: AppText(
            text: 'Signup',
            color: Appcolors.white,
            fontweight: FontWeight.w700,
            size: 20));
  }
}

class SigupTermsAndCondition extends StatelessWidget {
  const SigupTermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final readAuthCubit = context.read<AuthCubit>();
    final watchAuthCubit = context.watch<AuthCubit>();
    final size = MediaQuery.sizeOf(context);
    return Terms(
        ontap: () => readAuthCubit.changeAgreetoterms(),
        size: size,
        title: 'Agree to our terms of service & privacy policy guidline',
        status: watchAuthCubit.agreetoterms);
  }
}

class SignupPasswodTextfield extends StatelessWidget {
  const SignupPasswodTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final readAuthCubit = context.read<AuthCubit>();
    final watchAuthCubit = context.watch<AuthCubit>();
    return ApptextField(
        onTap: () => context.read<AuthCubit>().enableInputFields('pass'),
        controller: watchAuthCubit.passwordController,
        // obscure: watchAuthCubit.showPassword,
        validator: (value) {
          return AuthValidator.validatePassword(value!);
        },
        sufixIcon:
            //  InkWell(
            //     onTap: () {
            //       readAuthCubit.changeShowpassword();
            //     },

            watchAuthCubit.showPassword
                ? Icons.visibility
                : Icons.visibility_off,
        prefixIcon: Icons.lock_outline,
        title: 'Password',
        hintText: 'Enter Password');
  }
}

class SignupPhoneTextField extends StatelessWidget {
  const SignupPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final watchAuthCubit = context.watch<AuthCubit>();
    return ApptextField(
        onTap: () => context.read<AuthCubit>().enableInputFields('phone'),
        controller: watchAuthCubit.phoneController,
        validator: (value) {
          return AuthValidator.validateMobile(value!);
        },
        keyboardType: TextInputType.phone,
        prefixIcon: Icons.phone_android_outlined,
        title: 'Mobile Number',
        hintText: 'Enter Mobile Number');
  }
}

class SignupEmailTextfield extends StatelessWidget {
  const SignupEmailTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final watchAuthCubit = context.watch<AuthCubit>();
    return ApptextField(
        onTap: () => context.read<AuthCubit>().enableInputFields('email'),
        controller: watchAuthCubit.emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          return AuthValidator.validateEmail(value!);
        },
        prefixIcon: Icons.email_outlined,
        title: 'Email Address',
        hintText: 'Email');
  }
}

class SignupFirstnameTextfield extends StatelessWidget {
  const SignupFirstnameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchAuthCubit = context.watch<AuthCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: size.width * 0.45,
            child: ApptextField(
                onTap: () =>
                    context.read<AuthCubit>().enableInputFields('first'),
                onChange: (p0) => watchAuthCubit.updateState(),
                controller: watchAuthCubit.firstNameController,
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  return AuthValidator.validatePassword(value!);
                },
                title: 'FirstName',
                hintText: 'FirstName')),
        SizedBox(
            width: size.width * 0.45,
            child: ApptextField(
                onTap: () =>
                    context.read<AuthCubit>().enableInputFields('last'),
                onChange: (p0) => watchAuthCubit.updateState(),
                controller: watchAuthCubit.lastNameController,
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  return AuthValidator.validatePassword(value!);
                },
                title: 'LastName',
                hintText: 'LastName'))
      ],
    );
  }
}
