import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';

class VerticalWidget extends StatelessWidget {
  const VerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 243.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/pizaa.png",
                  height: 193.h,
                  width: double.infinity,
                ),
                Text(
                  StringsManager.minuteByTukTuk,
                  style: TextStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.gray,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.primary,
                      size: 25.w,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p5),
                      child: Text(
                        StringsManager.rate,
                        style: TextStyle(
                            color: ColorManager.primary, fontSize: FontSize.s11),
                      ),
                    ),
                    Text(
                      StringsManager.cafeRate,
                      style: TextStyle(
                          color: ColorManager.grayMedium, fontSize: FontSize.s12),
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p5),
                      child: Container(
                        child: CircleAvatar(
                          radius: 2,
                          backgroundColor: ColorManager.primary,
                        ),
                      ),
                    ),
                    Text(
                      StringsManager.westernFood,
                      style: TextStyle(
                          color: ColorManager.grayMedium, fontSize: FontSize.s12),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 31.8.h,
          );
        },
        itemCount: 4);
  }
}
