import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';

class RecentItemsWidget extends StatelessWidget {
  const RecentItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 75.h,
                width: 75.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage("assets/images/pizza3.png"),
                    )),
              ),

              Padding(
                padding:  EdgeInsets.only(left:AppPadding.p22 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsManager.mulberryPizzaByJosh,
                      style: TextStyle(
                        color: ColorManager.gray,
                        fontSize: FontSize.s20,
                        fontWeight: FontWeightManager.bold,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: AppPadding.p8),
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
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorManager.primary,
                          size: AppSize.s16,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: AppPadding.p5),
                          child: Text(StringsManager.rate,style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.medium,

                          ),),
                        ),
                        Text(
                          StringsManager.cafeRate,
                          style: TextStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.medium,
                            color: ColorManager.grayMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: AppPadding.p16,
            width: AppPadding.p22,
          );
        },
        itemCount: 4,
      ),
    );
  }
}
