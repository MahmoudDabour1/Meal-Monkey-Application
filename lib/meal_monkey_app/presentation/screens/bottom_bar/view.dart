import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/bottom_bar/bottom_bar_cubit.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/bottom_bar_widget/item_bottom_bar.dart';

import '../../../core/color_manager.dart';
import '../../../core/values_manager.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}
class _BottomBarScreenState extends State<BottomBarScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarCubit(),
      child: Builder(
          builder: (context) {
            final cubit = BottomBarCubit.get(context);
            return BlocConsumer<BottomBarCubit , BottomBarStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  extendBody: true,
                  body: cubit.pages[cubit.selectItem],
                  floatingActionButton: SizedBox(
                    width: 67,
                    height: 67,
                    child: FloatingActionButton(
                      onPressed: () {
                        cubit.changeBottomBar(cubit.selectItem=4);
                      },
                      backgroundColor: cubit.selectItem == 4
                          ? ColorManager.primary
                          : ColorManager.grayMedium,
                      child: const Icon(Icons.home,size: 45,),
                    ),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: SizedBox(
                    height: AppPadding.p70,
                    child: BottomAppBar(

                      color: Colors.white,
                      shape: const CircularNotchedRectangle(),
                      notchMargin: AppMargin.m12,
                      child: Row(
                        children: List.generate(
                            cubit.title.length,
                                (index) =>
                                ItemBottomBar(
                                  isSelected: index == cubit.selectItem,
                                  text: cubit.title[index],
                                  icon: cubit.icons[index],
                                  onPress: () {
                              cubit.changeBottomBar(index);
                            })),
                      ),
                    ),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
