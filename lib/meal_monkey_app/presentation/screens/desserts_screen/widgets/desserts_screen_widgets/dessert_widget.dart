import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/color_manager.dart';
import '../../../../../core/font_manager.dart';
import '../../../../../core/strings_manager.dart';
import '../../../../../core/values_manager.dart';

class DessertsWidget extends StatelessWidget {
  const DessertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context,int index){
      return  Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            height: 193.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/desserts.png",
                  ),
                )),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20,bottom: AppPadding.p24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.frenchApplePie,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.bold,
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
                      StringsManager.minuteByTukTuk,
                      style: TextStyle(
                          color: ColorManager.white, fontSize: FontSize.s12),
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
                      StringsManager.desserts,
                      style: TextStyle(
                          color: ColorManager.white, fontSize: FontSize.s12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }, separatorBuilder: (BuildContext context,int index){
      return SizedBox(
        height:AppPadding.p4,
      );
    }, itemCount: 5);
  }
}
