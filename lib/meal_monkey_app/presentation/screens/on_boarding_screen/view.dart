import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/on_boarding_screen/on_boarding_cubit.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/on_boarding_screen/widgets/const_slider.dart';
import 'widgets/slider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Builder(
        builder: (context) {
          return const Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomSlider(),
                  ),
                  Expanded(
                    child: CustomConstSlider(),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}