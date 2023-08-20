import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/meal_monkey_app/core/router/app_routers.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/login_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/sign_up_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/splash_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/start_screen/view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: AppRouters.splash,
      builder: (BuildContext context,GoRouterState state) {
      return const SplashScreen();
      }),
    GoRoute(
        path: AppRouters.startScreen,
      builder: (BuildContext context,GoRouterState state) {
      return  const StartScreen();
      }),
    GoRoute(
        path: AppRouters.login,
      builder: (BuildContext context,GoRouterState state) {
      return  const LoginScreen();
      }),
    GoRoute(
        path: AppRouters.signUp,
      builder: (BuildContext context,GoRouterState state) {
      return  const SignUpScreen();
      })
  ]);
}