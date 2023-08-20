import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';

import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';

class CustomSearchBar extends StatelessWidget {
   CustomSearchBar({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: searchController,
      validator: (value){},
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: ColorManager.grayLight,
        filled: true,
        contentPadding: EdgeInsets.all(AppPadding.p20),
        hintText: StringsManager.searchFood,
        hintStyle: TextStyle(
          color: ColorManager.gray,
          fontSize: FontSize.s14,
        ),
        prefixIcon: Icon(Icons.search),
      prefixIconColor: ColorManager.gray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: BorderSide.none,
        )
      ),




    ) ;
  }
}
