import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/values_manager.dart';

class HorizentalWidget extends StatelessWidget {
  const HorizentalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
       width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context,int index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppSize.s88,
                height: AppSize.s88,
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/alireza-etemadi-9G_oJBKwi1c-unsplash.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppPadding.p8,
              ),
              Text(
                StringsManager.offers,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.gray,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context,int index) {
         return SizedBox(
            width: 18,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
