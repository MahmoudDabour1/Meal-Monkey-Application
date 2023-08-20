import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 135.h,
                  width: 228.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage("assets/images/pizza2.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppPadding.p10,
                ),
                Text(
                  StringsManager.CafeDeBambaa,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    fontWeight: FontWeightManager.bold,
                    color: ColorManager.gray,
                  ),
                ),
                Row(

                  children: [
                    Text(
                      StringsManager.cafe,
                      style: TextStyle(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.medium,
                        color: ColorManager.grayMedium,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:AppPadding.p8 ),
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: ColorManager.primary,
                          radius: 2,
                        ),
                      ),
                    ),
                    Text(
                      StringsManager.westernFood,
                      style: TextStyle(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.medium,
                        color: ColorManager.grayMedium,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: AppPadding.p27,right: AppPadding.p5),
                      child: Icon(
                        Icons.star,
                        color: ColorManager.primary,
                        size: AppSize.s16,
                      ),
                    ),
                    Text(StringsManager.rate,style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s12,
                      fontWeight: FontWeightManager.medium,

                    ),),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: AppPadding.p20,
            );
          },
          itemCount: 4),
    );
  }
}
