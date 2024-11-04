import 'package:craftmanapp/constants/export.dart';
import 'package:flutter/material.dart';
 
import '../../../../globalwidget/export.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            ChangepasswordAppbar(size: size),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: Appcolors.white,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.04),
                  ChanePasswordTextfields(size: size),
                  SizedBox(height: size.height * 0.04),
                  ChangePasswordButon(size: size)
                ],
              ),
            ))
          ],
        ));
  }
}

class ChangePasswordButon extends StatelessWidget {
  const ChangePasswordButon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Appbutton(
        width: size.width,
        height: size.height * 0.06,
        onTap: () {},
        label: 'Confirm');
  }
}

class ChanePasswordTextfields extends StatelessWidget {
  const ChanePasswordTextfields({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppshadowContainer(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            const ApptextField(
                hintText: 'Current Password',
                // obscure: true,
                sufixIcon: Icons.visibility),
            SizedBox(height: size.height * 0.02),
            const ApptextField(
                hintText: 'New Password',
                // obscure: true,
                sufixIcon: Icons.visibility),
            SizedBox(height: size.height * 0.02),
            const ApptextField(
                hintText: 'Confirm Password',
                // obscure: true,
                sufixIcon: Icons.visibility),
            SizedBox(height: size.height * 0.02),
          ],
        ));
  }
}

class ChangepasswordAppbar extends StatelessWidget {
  const ChangepasswordAppbar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: const CustomAppbar(title: 'Change Password'),
    );
  }
}
