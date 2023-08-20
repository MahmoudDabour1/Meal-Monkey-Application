import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/desserts_screen/view.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../data/data_sources/menu_static.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {


     start (){
      navigatorTo(context: context, page: DessertsScreen());
    }


     nav (){
      ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: start()));
    }

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            ModalRoute.of(context)!.addLocalHistoryEntry(
              LocalHistoryEntry(
                onRemove: nav(),
              ),
            );
          },
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    width: 280.w,
                    height: 87.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 3.0),
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 56.w, top: 20.h, bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            menuList[index].title,
                            style: TextStyle(
                              fontSize: FontSize.s22,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.gray,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            menuList[index].description,
                            style: TextStyle(
                              fontSize: FontSize.s11,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.grayMedium,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, left: 10.w),
                child: Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        menuList[index].image,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 210.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 315.w, top: 50.h),
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      ModalRoute.of(context)!.addLocalHistoryEntry(
                        LocalHistoryEntry(
                          onRemove: navigatorTo(
                              context: context, page: DessertsScreen()),
                        ),
                      );
                      navigatorTo(context: context, page: DessertsScreen());
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 8,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 0.h,
        );
      },
      itemCount: menuList.length,
    );
  }


}


