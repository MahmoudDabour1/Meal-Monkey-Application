import 'package:flutter/material.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';

TextStyle _getTextStyle( double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({required double fontSize, required Color color}){
  return _getTextStyle(fontSize= FontSize.s14, FontWeightManager.regular, color);
}

TextStyle getMediumStyle({required double fontSize, required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getLightStyle(double fontSize , Color color){
  return _getTextStyle(fontSize= FontSize.s14, FontWeightManager.light, color);
}

TextStyle getBoldStyle ({
  required double fontSize,
  required Color color,
}){
  return _getTextStyle(fontSize = FontSize.s34, FontWeightManager.semiBold, color);
}



TextStyle getSemiBoldStyle(double fontSize, Color color) {
  return _getTextStyle(fontSize = FontSize.s30, FontWeightManager.medium, color);
}
