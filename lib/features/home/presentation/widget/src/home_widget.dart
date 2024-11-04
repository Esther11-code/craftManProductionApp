import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftmanapp/constants/util/useful_methods.dart';
import 'package:craftmanapp/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftmanapp/features/home/data/local/home_static_repo.dart';
import 'package:craftmanapp/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/page route/page_route.dart';
import '../../../../../constants/export.dart';
import '../../../../../globalwidget/export.dart';
import '../../../../splash_onboarding/data/local/onboardingimages.dart';
import '../export.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          AppshadowContainer(
            radius: 1000.r,
            shadowcolour: Appcolors.lightgrey,
            child: AppNetwokImage(
                height: size.width * 0.15,
                fit: BoxFit.cover,
                width: size.width * 0.15,
                radius: 1000.r,
                imageUrl: ''),
          ),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text:
                      '${Utils.getGreting()}, ${context.watch<AuthCubit>().user.firstName}',
                  fontweight: FontWeight.w700),
              const AppText(text: 'Lets get things done today!', size: 14),
            ],
          ),
          const Spacer(),
          const NotificationIcon(),
        ],
      ),
    );
  }
}

class HomeService extends StatelessWidget {
  const HomeService({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final catgory = context.watch<HomeCubit>().homeCategory;
    return Expanded(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            children: List.generate(
              0,
              (index) => CategorieContainer(index: index, size: size),
            )));
  }
}

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return HomeTextfield(
        // onChange: (value) {
        //   context
        //       .read<HomeCubit>()
        //       .searchCategories(value, HomeStaticRepo.services);
        // },
        size: size,
        prefixicon: Icon(Icons.search, size: 25.sp),
        hintext: 'Search...');
  }
}

class CategorieContainer extends StatelessWidget {
  const CategorieContainer(
      {super.key, required this.size, required this.index});

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    final watchHome = context.watch<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is Searched) {}
        return AppshadowContainer(
            onTap: () {
              context.read<HomeCubit>().getArtisans(
                  id: watchHome.category[index].id!,
                  category: watchHome.category[index].category!);
              Navigator.pushNamed(context, RouteName.skilldetail);
            },
            shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
            margin: EdgeInsets.only(
                right: size.width * 0.035,
                bottom: size.width * 0.03,
                top: size.width * 0.03),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            width: size.width * 0.3,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                  HomeStaticRepo.servicesIcon[
                      watchHome.category[index].category!.split(' ').first],
                   
                  size: 45.sp),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                  height: size.height * 0.042,
                  child: AppText(
                      textalign: TextAlign.center,
                      text: watchHome.category[index].category!
                                  .split(' ')
                                  .first ==
                              watchHome.category[index].category!
                                  .split(' ')
                                  .last
                          ? watchHome.category[index].category!.split(' ').first
                          : '${watchHome.category[index].category!.split(' ').first}\n${watchHome.category[index].category!.split(' ').lastOrNull ?? ''}',
                 
                      size: 14,
                      fontweight: FontWeight.w500))
            ]));
      },
    );
  }
}

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppshadowContainer(
          width: size.width,
          color: const Color.fromARGB(217, 21, 21, 11),
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.4,
                  child: AppText(
                      maxline: 6,
                      text: 'Get the best services providers with our services',
                      color: Appcolors.white,
                      fontweight: FontWeight.w500)),
              Image.asset(OnboardingImagesData.onboarding1,
                  height: size.height * 0.18)
            ],
          ),
        ),
        10.verticalSpace,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => AppshadowContainer(
                      border: index != 0,
                      borderColor: const Color.fromARGB(217, 21, 21, 11),
                      margin: EdgeInsets.only(right: size.width * 0.02),
                      color: index == 0
                          ? const Color.fromARGB(217, 21, 21, 11)
                          : const Color.fromARGB(217, 21, 21, 11)
                              .withOpacity(0.1),
                      width: index == 0 ? size.width * 0.15 : size.width * 0.04,
                      height: size.width * 0.04,
                    )))
      ],
    );
  }
}
