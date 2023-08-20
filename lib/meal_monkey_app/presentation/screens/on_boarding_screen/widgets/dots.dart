import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/data/data_sources/on_boarding_static.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/on_boarding_screen/on_boarding_cubit.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = OnBoardingCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                margin: EdgeInsets.only(right: AppMargin.m5),
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.r50),
                  ),
                  color: cubit.currentPage == index
                      ? ColorManager.primary
                      : ColorManager.gray,
                ),
                height: AppSize.s10,
                curve: Curves.easeIn,
                width: cubit.currentPage == index ? AppSize.s20 : AppSize.s10,
              ),
            ),
          ],
        );
      },
    );
  }
}
