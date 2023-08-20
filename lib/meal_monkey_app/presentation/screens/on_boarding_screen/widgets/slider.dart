import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/on_boarding_screen/on_boarding_cubit.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/values_manager.dart';
import '../../../../data/data_sources/on_boarding_static.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = OnBoardingCubit.get(context);
        return PageView.builder(
          controller: cubit.pageController,
          onPageChanged: cubit.onPageChanged,
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) =>
              Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(
                        top: AppPadding.p112, bottom: AppPadding.p30),
                    child: Image.asset(
                      onBoardingList[i].image,
                      width: 241.25.w,
                      height: 305.h,
                    ),
                  ),
                  SizedBox(
                    height: AppPadding.p30,
                  ),
                  Text(
                    onBoardingList[i].title,
                    style: TextStyle(
                      fontSize: AppSize.s28,
                      fontWeight: FontWeightManager.semiBold,
                      color: ColorManager.gray,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppPadding.p33,),
                    child: Text(
                      onBoardingList[i].description,
                      style: TextStyle(
                        fontSize: AppSize.s13,
                        fontWeight: FontWeightManager.regular,
                        color: ColorManager.gray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }
}
