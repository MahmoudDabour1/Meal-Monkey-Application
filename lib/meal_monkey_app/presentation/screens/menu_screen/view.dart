import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/search_bar_widget/search_bar.dart';

import '../../../core/assets_manager.dart';
import 'widgets/menu_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
         titleSpacing: AppPadding.p22,
        elevation: 0,
        backgroundColor: ColorManager.white,
        automaticallyImplyLeading: false,
        // centerTitle: false,
        title: Text(
          StringsManager.menu,
          style: TextStyle(
            color: ColorManager.gray,
            fontWeight: FontWeightManager.semiBold,
            fontSize: FontSize.s24,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.p20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartShopping,
                color: ColorManager.gray,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: AppPadding.p20,
                left: AppPadding.p20,
                top: AppPadding.p24,
                bottom: AppPadding.p30,
              ),
              child: CustomSearchBar(),
            ),
            Stack(
              children: [
                Container(
                  height: 485.h,
                  width: 97.w,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(38.r),
                          bottomRight: Radius.circular(38.r))),
                ),
                Container(
                  height: 485.h,
                  width: 97.w,
                  decoration: BoxDecoration(

                      image: DecorationImage(
                    image: AssetImage(ImageAssets.sideBarOrange),
                  )),
                ),
                MenuWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
