import 'package:flutter/material.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';

import '../../../core/values_manager.dart';

class ItemBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function() onPress;

  const ItemBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color:
                    isSelected ? ColorManager.primary : ColorManager.grayMedium,
                size:AppSize.s25,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color:
                    isSelected ? ColorManager.primary : ColorManager.grayMedium,
                fontSize:isSelected? FontSize.s16:FontSize.s12,
                fontWeight: isSelected
                    ? FontWeightManager.semiBold
                    : FontWeightManager.medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
