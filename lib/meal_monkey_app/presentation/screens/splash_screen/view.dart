import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/assets_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/on_boarding_screen/view.dart';

import '../bottom_bar/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    late bool isLogin;
    var user = FirebaseAuth.instance.currentUser;
    if(user == null){
      isLogin = false;
    }else{
      isLogin = true;
    }
    Timer(const Duration(seconds: 3),(){
    navigatorTo(page: isLogin==true ?const BottomBarScreen():const OnBoardingScreen(),context: context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.splashBackground,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.splashLogo,
                  width: 103.11.w,
                  height: 103.11.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppPadding.p14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.meal,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s34,
                          fontWeight: FontWeightManager.bold,
                        ),
                      ),
                      Text(
                        StringsManager.monkey,
                        style: TextStyle(
                          color: ColorManager.gray,
                          fontSize: FontSize.s34,
                          fontWeight: FontWeightManager.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: AppPadding.p6),
                  child: Text(
                    StringsManager.foodDelivery,
                    style: TextStyle(
                      color: ColorManager.gray,
                      fontSize: FontSize.s10,
                      fontWeight: FontWeightManager.regular,
                      wordSpacing: 1,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
