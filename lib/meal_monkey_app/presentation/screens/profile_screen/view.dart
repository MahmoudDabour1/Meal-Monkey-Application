import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/core/assets_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/profile_screen/bottom_model.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/profile_screen/profile_cubit.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/elevated_button.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/text_form_field_widget/text_form_field.dart';
import '../../../core/font_manager.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../../../data/models/user_data/user_data_model.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  String email = "";
  String name = "";
  String phone = "";

  String address = "";
  bool isSameUser = false;
  bool isEnable = false;
bool isEdit = false;
  // final user = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();
      if (userDoc == null) {
        return;
      } else {
        setState(() {
          email = userDoc.get('email');
          name = userDoc.get('name');
          phone = userDoc.get('mobileNo');
          address = userDoc.get('address');
        });
        User? user = auth.currentUser;
        String uid = user!.uid;
        setState(() {
          isSameUser = uid == widget.userId;
        });
      }
    } catch (error) {}
  }

  // void userUpdate({
  //   required String name,
  //   required String uId,
  //   required String email,
  //   required String address,
  //   required String mobileNo,
  // }) {
  //   UserDataModel model = UserDataModel(
  //     name: name,
  //     uId: uId,
  //     email: email,
  //     address: address,
  //     mobileNo: mobileNo,
  //   );
  //   FirebaseFirestore.instance.collection('users').doc(uId).update(
  //       model.toMap());


    @override
    Widget build(BuildContext context) {
      final emailController = TextEditingController(text: email);
      final nameController = TextEditingController(text: name);
      final addressController = TextEditingController(text: address);
      final phoneController = TextEditingController(text: phone);

      return BlocProvider(
        create: (context) => ProfileCubit(),
        child: Builder(builder: (context) {
          final cubit = ProfileCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              elevation: 0,
              titleSpacing: AppPadding.p22,
              backgroundColor: ColorManager.white,
              centerTitle: false,
              title: Text(
                StringsManager.profile,
                style: TextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  color: ColorManager.gray,
                  fontSize: FontSize.s24,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: AppPadding.p20),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.cartShopping,
                      color: ColorManager.gray,
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Column(
                  children: [
                    BlocBuilder<ProfileCubit, ProfileStates>(
                      builder: (context, state) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: AppPadding.p30, bottom: AppPadding.p16),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        topRight: Radius.circular(18),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 150.h,
                                        child: BottomModel(
                                          cubit: cubit,
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                width: 102.w,
                                height: 102.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        ImageAssets.camera,
                                      )),
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrangeAccent.withOpacity(
                                      0.2),
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    if (cubit.myImage != null)
                                      Image.file(
                                        cubit.myImage!,
                                        height: 200.h,
                                        width: 200.w,
                                        fit: BoxFit.cover,
                                      ),
                                    Container(
                                      width: 86.w,
                                      height: 23.h,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5)),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: cubit.myImage != null
                                            ? ColorManager.white
                                            : ColorManager.gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    TextButton.icon(
                        onPressed: () {
                          isEnable = !isEnable;
                          isEdit = ! isEdit;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.edit,
                          color: ColorManager.primary,
                          size: 10,
                        ),
                        label: Text(
                          StringsManager.editProfile,
                          style: TextStyle(
                            fontSize: AppSize.s10,
                            color: ColorManager.primary,
                          ),
                        )),
                    Text(
                      "Hi there $name",
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.gray,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.signOut(context);
                      },
                      child: Text(
                        StringsManager.signOut,
                        style: TextStyle(
                          fontSize: FontSize.s11,
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.gray,
                        ),
                      ),
                    ),
                    isEdit? Column(
                      children: [
                        CustomTextFormField(
                          name: StringsManager.name,
                          controller: nameController,
                          enable: isEnable,
                        ),
                        CustomTextFormField(
                          name: StringsManager.email,
                          controller: emailController,
                          enable: isEnable,
                        ),
                        CustomTextFormField(
                          name: StringsManager.mobileNo,
                          controller: phoneController,
                          enable: isEnable,
                        ),
                        CustomTextFormField(
                          name: StringsManager.address,
                          controller: addressController,
                          enable: isEnable,
                        ),
                        CustomElevatedButton(
                          name: StringsManager.save,
                          function: () {},
                        ),
                      ],
                    ):SizedBox(),

                  ],
                ),
              ),
            ),
          );
        }),
      );
    }
  }

  final nameController = TextEditingController();
