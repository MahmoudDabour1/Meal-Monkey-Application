import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/login_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/sign_up_screen/sign_up_cubit.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/elevated_button.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/text_form_field.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/validation.dart';
import '../../../core/color_manager.dart';
import '../../../core/strings_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Builder(
        builder: (context) {
          final cubit = SignUpCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p20),
                  child: Form(
                    key: cubit.formState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: AppPadding.p60),
                          child: Text(
                            StringsManager.signUp,
                            style: TextStyle(
                              fontSize: FontSize.s30,
                              fontWeight: FontWeightManager.medium,
                              color: ColorManager.gray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppPadding.p12, bottom: AppPadding.p8),
                          child: Text(
                            StringsManager.detailsSignUp,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.regular,
                              color: ColorManager.grayMedium,
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          focusNode: cubit.nameFocusNode,
                          name: "Name",
                          controller: cubit.nameController,
                          validator: nameValidator,
                          keyboardType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(cubit.emailFocusNode),
                        ),
                        CustomTextFormField(
                          focusNode: cubit.emailFocusNode,
                          name: "Email",
                          controller: cubit.emailController,
                          validator: emailValidator,
                          keyboardType: TextInputType.emailAddress,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(cubit.mobileNoFocusNode),
                        ),
                        CustomTextFormField(
                          focusNode: cubit.mobileNoFocusNode,
                          name: "Mobile No",
                          controller: cubit.mobileNoController,
                          validator: phoneValidator,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(cubit.addressFocusNode),
                        ),
                        CustomTextFormField(
                          focusNode: cubit.addressFocusNode,
                          name: "Address",
                          controller: cubit.addressController,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(cubit.passwordFocusNode),
                        ),
                        CustomTextFormField(
                          focusNode: cubit.passwordFocusNode,
                          name: "Password",
                          controller: cubit.passwordController,
                          validator: passwordValidator,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(cubit.confirmPasswordFocusNode),
                        ),
                        CustomTextFormField(
                          focusNode: cubit.confirmPasswordFocusNode,
                          name: "Confirm Password",
                          controller: cubit.confirmPasswordController,
                          validator: passwordValidator,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          isLastInput: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppPadding.p28, bottom: AppPadding.p24),
                          child: BlocConsumer<SignUpCubit, SignUpStates>(
                            listener: (context, state) {
                              if (state is SignUpErrorState) {
                                AwesomeDialog(
                                        context: context,
                                        title: "Error",
                                        body: const Text("Error"))
                                    .show();
                              }
                              if (state is SignUpSuccessState) {
                                if (cubit.passwordController.value !=
                                    cubit.confirmPasswordController.value) {
                                  AwesomeDialog(
                                    context: context,
                                    title: "error",
                                    body:
                                        const Text("Confirm Password is Wrong"),
                                  ).show();
                                } else {
                                  navigatorTo(
                                    page: const LoginScreen(),
                                    context: context,
                                  );
                                  AwesomeDialog(
                                    context: context,
                                    title: "success",
                                    dialogType: DialogType.success,
                                    dialogBackgroundColor:
                                        Colors.orangeAccent[200],
                                    barrierColor: ColorManager.primary,
                                    body: const Text(
                                        "Send Email Verification\nPlease Check Your Email"),
                                  ).show();
                                }
                              }
                            },
                            builder: (context, state) {
                              if (state is SignUpLoadingState) {
                                return CircularProgressIndicator(
                                  color: ColorManager.primary,
                                );
                              }
                              return CustomElevatedButton(
                                name: StringsManager.signUp,
                                function: () async {
                                  await cubit.signUp(
                                    name: cubit.nameController.text,
                                    email: cubit.emailController.text,
                                    mobileNo: cubit.mobileNoController.text,
                                    address: cubit.addressController.text,
                                    password: cubit.passwordController.text,
                                    context: context,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringsManager.alreadyHaveAnAccount,
                              style: TextStyle(
                                fontWeight: FontWeightManager.regular,
                                fontSize: FontSize.s14,
                                color: ColorManager.grayMedium,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navigatorTo(
                                    context: context,
                                    page: const LoginScreen());
                              },
                              child: Text(
                                StringsManager.login,
                                style: TextStyle(
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.bold,
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
