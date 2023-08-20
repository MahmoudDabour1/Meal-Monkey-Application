import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';

import '../../../core/strings_manager.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringsManager.otp,
                style: TextStyle(
                  fontSize: FontSize.s24,
                  color: ColorManager.gray,
                  fontWeight: FontWeightManager.semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                StringsManager.otpDetails,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  color: ColorManager.grayMedium,
                  fontWeight: FontWeightManager.regular,
                ),
                textAlign: TextAlign.center,
              ),

              OtpTextField(
                numberOfFields: 4,
                borderColor: ColorManager.grayLight,
                showFieldAsBox: true,
                autoFocus: true,
                keyboardType: TextInputType.number,
                clearText: true,
                disabledBorderColor: ColorManager.grayLight,
                cursorColor: ColorManager.primary,
                focusedBorderColor: ColorManager.primary,
                borderWidth: 4,
                onCodeChanged: (String code){
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
