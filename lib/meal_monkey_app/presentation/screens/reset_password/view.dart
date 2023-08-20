import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/login_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/elevated_button.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/text_form_field.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/validation.dart';

import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/strings_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  final auth = FirebaseAuth.instance;

  Future<dynamic> resetPassword ({required String email , required BuildContext context})async{
   final status = await auth.sendPasswordResetEmail(email: email ).then((value) {
      AwesomeDialog(context: context,dialogType: DialogType.success,title: "Please Check Your Email").show().then((value) {
        navigatorTo(context: context, page: LoginScreen());
      });

    });
  }

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
                StringsManager.resetPassword,
                style: TextStyle(
                  fontSize: FontSize.s30,
                  color: ColorManager.gray,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
            Text(
              StringsManager.detailsResetPassword,
              style: TextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.gray,
                fontWeight: FontWeightManager.regular,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:  EdgeInsets.only(top:AppPadding.p60,bottom:AppPadding.p34 ),
              child: CustomTextFormField(
                name: StringsManager.email,
                controller: emailController,
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
                isLastInput: true,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(emailFocusNode),
              ),
            ),
            CustomElevatedButton(name: StringsManager.send, function: (){
              resetPassword(email: emailController.text, context: context);

            }),
          ],
        ),
      ),
    );
  }
}
