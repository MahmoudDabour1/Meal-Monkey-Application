import 'package:flutter/material.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/validation.dart';

import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../../widgets/buttons_widgets/elevated_button.dart';
import '../../widgets/text_form_field_widget/text_form_field.dart';

class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          children: [
            Padding(
              padding:
              EdgeInsets.only(top: AppPadding.p60, bottom: AppPadding.p12),
              child: Text(
                StringsManager.newPassword,
                style: TextStyle(
                  fontSize: FontSize.s30,
                  color: ColorManager.gray,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
            Text(
              StringsManager.newPasswordDetails,
              style: TextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.gray,
                fontWeight: FontWeightManager.regular,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:  EdgeInsets.only(top:AppPadding.p39,bottom:AppPadding.p14 ),
              child: CustomTextFormField(
                name: StringsManager.newPassword,
                controller: newPasswordController,
                validator: passwordValidator,
                keyboardType: TextInputType.emailAddress,
                isLastInput: true,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(newPasswordFocusNode),
              ),
            ),
            CustomTextFormField(
              name: StringsManager.confirmPassword,
              controller: confirmPasswordController,
              validator: passwordValidator,
              keyboardType: TextInputType.emailAddress,
              isLastInput: true,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(confirmPasswordFocusNode),
            ),
            SizedBox(height: AppPadding.p28,),

            CustomElevatedButton(name: StringsManager.next, function: (){}),
          ],
        ),
      ),
    );
  }
}
