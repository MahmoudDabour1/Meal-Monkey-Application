import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/home_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/more_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/profile_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/reset_password/view.dart';

import 'meal_monkey_app/core/helper_method.dart';
import 'meal_monkey_app/presentation/screens/bottom_bar/view.dart';
import 'meal_monkey_app/presentation/screens/desserts_screen/view.dart';
import 'meal_monkey_app/presentation/screens/menu_screen/view.dart';
import 'meal_monkey_app/presentation/screens/otp/view.dart';
import 'meal_monkey_app/presentation/screens/splash_screen/view.dart';
import 'meal_monkey_app/presentation/screens/home_screen/widgets/vertical_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


   runApp(
   const MyApp(),
      // DevicePreview(
      // enabled: true,
      // builder: (context) {
      //   return const MyApp();
      // }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
      child:  ProfileScreen(userId: uid,),
    );
  }
}

  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final  uid = user!.uid;
