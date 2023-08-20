import 'package:flutter/material.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';

import '../../../core/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text(StringsManager.viewAll,style: TextStyle(
      fontSize: FontSize.s13,
      color: ColorManager.primary,
    ),));
  }
}
