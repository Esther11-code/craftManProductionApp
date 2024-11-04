import 'package:craftmanapp/constants/export.dart';
import 'package:craftmanapp/features/splash_onboarding/data/local/onboardingimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/page route/detail/route_name.dart';
import '../../../../globalwidget/export.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../src/auth_widgets_export.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final readAuthCubit = context.read<AuthCubit>();
    final watchAuthCubit = context.watch<AuthCubit>();
    return AppScaffold(
      isloading: watchAuthCubit.state is AuthLoadingState,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginState) {}
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: size.height * 0.08),
          Image.asset(OnboardingImagesData.welcome,
              height: size.height * 0.15, width: size.width * 0.9),
          Center(
              child: AppText(
                  text: 'Welcome Back!',
                  fontweight: FontWeight.w600,
                  size: 21,
                  color: Appcolors.blue)),
          SizedBox(height: size.height * 0.02),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: const AppText(
                  text: 'Log in to continue', fontweight: FontWeight.w500)),
          Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                children: [
                  SizedBox(height: size.height * 0.03),
                  ApptextField(
                      title: 'Email Address',
                      controller: watchAuthCubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return null;
                      },
                      prefixIcon: Icons.email_outlined,
                      hintText: 'Email Address'),
                  20.verticalSpace,
                  ApptextField(
                      title: 'Password',
                      controller: watchAuthCubit.passwordController,
                      // obscure: watchAuthCubit.showPassword,
                      validator: (value) {
                        return null;
                      },
                      sufixIcon:
                          // InkWell(
                          //     onTap: () {
                          //       readAuthCubit.changeShowpassword();
                          //     },

                          watchAuthCubit.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                      prefixIcon: Icons.lock_outline,
                      hintText: 'Password'),
                  SizedBox(height: size.height * 0.025),
                  Terms(
                      ontap: () {
                        readAuthCubit.changeStaylogin();
                      },
                      size: size,
                      title: 'Stay Loged In ',
                      status: watchAuthCubit.stayLogin),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteName.forgetPassword);
                        },
                        child: AppText(
                            text: 'Forget Password?',
                            size: 14,
                            color: Appcolors.blue,
                            fontweight: FontWeight.w700),
                      )),
                  SizedBox(height: size.height * 0.04),
                  Appbutton(
                      isLoading: watchAuthCubit.state is AuthLoadingState,
                      onTap: () {
                        // readAuthCubit.login();
                        Navigator.pushNamed(context, RouteName.successLogin);
                      },
                      label: 'Log In'),
                  SizedBox(height: size.height * 0.02),
                  SignupOrLogin(
                      ontap: () =>
                          Navigator.pushNamed(context, RouteName.signup),
                      subTitle: 'Signup',
                      title: 'Don\'t have an account?'),
                  SizedBox(height: size.height * 0.08),
                ]),
          )
        ]),
      ),
    );
  }
}
