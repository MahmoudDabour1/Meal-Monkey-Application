import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_data/user_data_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNoFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  Future<dynamic> signUp(
      {required String name,
      required String email,
      required String mobileNo,
      required String address,
      required String password,
      required BuildContext context}) async {
    emit(SignUpLoadingState());
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) async {
          await user?.sendEmailVerification();
          emit(SignUpSuccessState());
          userCreate(
            name: name,
            uId: value.user!.uid,
            email: email,
            address: address,
            mobileNo: mobileNo,
          );
        });
      } on FirebaseAuthException catch (e) {
        emit(SignUpErrorState());
        if (e.code == 'weak_password') {
          AwesomeDialog(
                  context: context,
                  title: "Error",
                  body: const Text("Password is too weak"))
              .show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: context,
                  title: "Error",
                  body: const Text("The account already exists for that email"))
              .show();
        }
      } catch (e) {
        emit(SignUpErrorState());
        AwesomeDialog(
                context: context, title: "Error", body: Text(e.toString()))
            .show();
      }
    } else {
      AwesomeDialog(
        context: context,
        title: "Error",
        body: const Text("Not Valid"),
      ).show();
    }
  }

  void userCreate({
    required String name,
    required String uId,
    required String email,
    required String address,
    required String mobileNo,
  }) {
    UserDataModel model = UserDataModel(
      name: name,
      uId: uId,
      email: email,
      address: address,
      mobileNo: mobileNo,
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap());
  }
}
