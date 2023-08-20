import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/assets_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/login_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/sign_up_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/elevated_button.dart';
import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';

class StartScreen extends StatefulWidget {
   const StartScreen({super.key});


  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
        Image.asset(
          ImageAssets.topShapeBackground,
          width: double.infinity,
          // height: 382.h,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 260.h),
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: 103.11.w,
                  height: 103.11.h,
                ),
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
                padding:
                    EdgeInsets.only(top: AppPadding.p6, bottom: AppPadding.p44),
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
              Text(
                StringsManager.discover,
                style: TextStyle(
                  color: ColorManager.grayMedium,
                  fontSize: FontSize.s13,
                  fontWeight: FontWeightManager.regular,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: AppPadding.p36),
                child: CustomElevatedButton(name: StringsManager.login, function: () {
                  navigatorTo(page: const LoginScreen(),context: context);
                },)
              ),
              Padding(
                padding: EdgeInsets.only(top: AppPadding.p20),
                child: OutlinedButton(
                  onPressed: () {
                    navigatorTo(page: const SignUpScreen(),context: context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ColorManager.primary, fixedSize: Size(307.w, 56.h),
                    side: BorderSide(
                      color: ColorManager.primary,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.sp),
                    ),
                  ),
                  child: Text(
                    StringsManager.createAnAccount,
                    style: TextStyle(
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
