import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/desserts_screen/widgets/desserts_screen_widgets/dessert_widget.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/search_bar_widget/search_bar.dart';


class DessertsScreen extends StatelessWidget {
  const DessertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        centerTitle: false,
        title: Text(
          StringsManager.desserts,
          style: TextStyle(
            fontWeight: FontWeightManager.semiBold,
            color: ColorManager.gray,
            fontSize: FontSize.s24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartShopping,
              color: ColorManager.gray,
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorManager.gray,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: AppPadding.p24, bottom: AppPadding.p20,left:AppPadding.p20,right: AppPadding.p20, ),
              child: CustomSearchBar(),
            ),
            DessertsWidget(),
          ],
        ),
      ),
    );
  }
}
