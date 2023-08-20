import 'package:flutter/material.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/styles_manager.dart';


ThemeData getApplicationTheme(){
  return ThemeData(
    primaryColor: ColorManager.primary,


    textTheme: TextTheme(


      displayLarge: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s34,),
      labelLarge: getBoldStyle(fontSize:FontSize.s20,color:  ColorManager.gray,),

      headlineLarge: getSemiBoldStyle(FontSize.s30,  ColorManager.gray),

      headlineMedium:getRegularStyle(fontSize:  FontSize.s14,color:  ColorManager.gray,),

      titleMedium: getSemiBoldStyle(FontSize.s14, ColorManager.primary),
     titleSmall:  getRegularStyle(fontSize: FontSize.s13, color: ColorManager.grayMedium,),

      bodyLarge: getRegularStyle(fontSize: FontSize.s16,color:  ColorManager.primary),

      bodySmall: getRegularStyle(fontSize: FontSize.s12,color: ColorManager.white),
    ),
  );
}