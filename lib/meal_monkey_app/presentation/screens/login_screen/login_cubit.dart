import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  late UserCredential userCredential;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoadingState());
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          if (value.user!.emailVerified == false) {
            AwesomeDialog(
                    context: context,
                    title: "Error",
                    dialogType: DialogType.warning,
                    dialogBackgroundColor: Colors.orangeAccent[200],
                    body: const Text(
                        "please Check your Email To verification email "))
                .show();
          } else {
            emit(LoginSuccessState());
          }
        });
      } on FirebaseAuthException catch (e) {
        emit(LoginErrorState(msg: e.toString()));
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            title: "Error",
            body: const Text("No user found for that email"),
          ).show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            title: "Error",
            body: const Text("Wrong password provided for that user"),
          ).show();
        }
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
