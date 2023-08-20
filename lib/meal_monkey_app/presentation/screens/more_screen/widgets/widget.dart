import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';
import '../../../../data/data_sources/more_static.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                width: 317.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: ColorManager.grayLight2,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        AppPadding.p13,
                      ),
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: ColorManager.grayMedium2,
                        ),
                        child: Icon(
                          moreList[index].icon,
                        ),
                      ),
                    ),
                    Text(
                      moreList[index].title,
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.gray,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 300.w, top: 20.h),
                child: Container(
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                    color: ColorManager.grayLight2,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 19.h,
          );
        },
        itemCount: moreList.length);
  }
}
