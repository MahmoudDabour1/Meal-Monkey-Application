import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/meal_monkey_app/core/helper_method.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/start_screen/view.dart';
import '../../../../core/values_manager.dart';
import '../../../widgets/buttons_widgets/elevated_button.dart';
import '../on_boarding_cubit.dart';
import 'dots.dart';

class CustomConstSlider extends StatelessWidget {
  const CustomConstSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = OnBoardingCubit.get(context);
        return Column(
          children: [
            const Dots(),
            Padding(
              padding: EdgeInsets.only(top: AppPadding.p40),
              child: CustomElevatedButton(
                  name: "Next",
                  function: () {
                    if (cubit.onLastPage()) {
                      navigatorTo(context: context, page: const StartScreen());
                    } else {
                      cubit.next();
                    }
                  }),
            ),
          ],
        );
      },
    );
  }
}
