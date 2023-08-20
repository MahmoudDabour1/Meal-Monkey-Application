
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';

class CustomElevatedButtonWithIcon extends StatelessWidget {

  final String name;
  final VoidCallback function;
  final Color color;
  final IconData icon;
  const  CustomElevatedButtonWithIcon({super.key,required this.name,required this.function,required this.color,required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(307.w, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.sp),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(icon),
              SizedBox(
                width:33.w ,
              ),
              Text(
                name,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.semiBold,
                ),
              )
            ],
          ),
        ));
  }
}
