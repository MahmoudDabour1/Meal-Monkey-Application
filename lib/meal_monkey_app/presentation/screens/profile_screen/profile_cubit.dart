import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';

import '../login_screen/view.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  File? myImage;
  final formKey = GlobalKey<FormState>();

  
  void selectImage({ImageSource? source}) {
    ImagePicker.platform
        .getImage(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        myImage = File(value.path);
        Navigator.pop(navigatorKey.currentContext!);
        emit(ProfileChangeImageState());
      }
    });
  }



  signOut(BuildContext context) async {
    return await FirebaseAuth.instance.signOut().then((value) {
      navigatorTo(
        page: const LoginScreen(),
        context: context,
      );
    });
  }
  
  

//  setImage(){
//   if (myImage != null)
//     Image.file(
//       myImage!,
//       height: 200.h,
//       width: 200.w,
//       fit: BoxFit.cover,
//     );
//   emit(ProfileSetImageState());
// }
}
