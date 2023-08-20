import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';

class CustomElevatedButton extends StatelessWidget {

  final String name;
  final VoidCallback function;
 const  CustomElevatedButton({super.key,required this.name,required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          fixedSize: Size(307.w, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.sp),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.semiBold,
          ),
        ));
  }
}
