import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/more_screen/widgets/widget.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/search_bar_widget/search_bar.dart';

import '../../../core/assets_manager.dart';
import '../../../core/helper_method.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../login_screen/view.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: AppPadding.p22,
        backgroundColor: ColorManager.white,
        centerTitle: false,
        title: Text(
          StringsManager.more,
          style: TextStyle(
            fontWeight: FontWeightManager.semiBold,
            color: ColorManager.gray,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Padding(
          padding:  EdgeInsets.only(top: AppPadding.p30),
          child: Column(
            children: [
              MoreWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
