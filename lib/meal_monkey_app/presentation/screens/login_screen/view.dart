import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/bottom_bar/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/login_screen/login_cubit.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/sign_up_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/elevated_botton_with_icon.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/elevated_button.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/text_form_field.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/validation.dart';

import '../../../core/strings_manager.dart';
import '../reset_password/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formState,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(
                        StringsManager.login,
                        style: TextStyle(
                          fontSize: FontSize.s30,
                          color: ColorManager.gray,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppPadding.p12, bottom: AppPadding.p36),
                        child: Text(
                          StringsManager.detailsLogin,
                          style: TextStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.gray,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        name: StringsManager.email,
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(cubit.emailFocusNode),
                      ),
                      CustomTextFormField(
                        name: StringsManager.password,
                        controller: cubit.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: passwordValidator,
                        isLastInput: true,
                        isPassword: true,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(cubit.passwordFocusNode),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppPadding.p28, bottom: AppPadding.p28),
                        child: BlocConsumer<LoginCubit, LoginStates>(
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              navigatorTo(
                                  context: context, page: const BottomBarScreen());
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primary,
                                ),
                              );
                            }
                            return CustomElevatedButton(
                                name: StringsManager.login,
                                function: () async {
                                  await cubit.login(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                    context: context,
                                  );
                                });
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorTo(context: context, page: ResetPasswordScreen());
                        },
                        child: Text(
                          StringsManager.forgotPassword,
                          style: TextStyle(
                            fontWeight: FontWeightManager.regular,
                            fontSize: FontSize.s14,
                            color: ColorManager.grayMedium,
                          ),
                        ),
                      ),
                      Text(
                        StringsManager.loginWith,
                        style: TextStyle(
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s14,
                          color: ColorManager.grayMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppPadding.p27, bottom: AppPadding.p28),
                        child: CustomElevatedButtonWithIcon(
                            name: StringsManager.facebook,
                            function: () async {
                              await cubit.signInWithFacebook().then((value) {
                                navigatorTo(
                                    context: context, page: const BottomBarScreen());
                              });
                            },
                            color: ColorManager.blue,
                            icon: FontAwesomeIcons.facebookF),
                      ),
                      CustomElevatedButtonWithIcon(
                        name: StringsManager.google,
                        function: () async {
                          await cubit.signInWithGoogle().then((value) {
                            navigatorTo(
                                context: context, page: const BottomBarScreen());
                          });
                        },
                        color: ColorManager.red,
                        icon: FontAwesomeIcons.googlePlusG,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringsManager.doNotHavAnAccount,
                              style: TextStyle(
                                fontSize: FontSize.s14,
                                fontWeight: FontWeightManager.regular,
                                color: ColorManager.grayMedium,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navigatorTo(
                                    page: const SignUpScreen(),
                                    context: context);
                              },
                              child: Text(
                                StringsManager.signUp,
                                style: TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
