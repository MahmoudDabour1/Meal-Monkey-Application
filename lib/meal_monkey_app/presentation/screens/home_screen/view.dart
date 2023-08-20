import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/core/color_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/font_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';
import 'package:meal_monkey/meal_monkey_app/core/values_manager.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/home_screen/widgets/most_popular_widget.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/home_screen/widgets/recent_items_widget.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/widgets/buttons_widgets/text_button_widget.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/home_screen/widgets/horizental_widget.dart';
import 'widgets/vertical_widget.dart';
import '../../widgets/search_bar_widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppPadding.p55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringsManager.goodMorning,
                          style: TextStyle(
                              fontSize: FontSize.s20,
                              color: ColorManager.gray,
                              fontWeight: FontWeightManager.semiBold)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.cartShopping,
                            color: ColorManager.gray,
                          ))
                    ],
                  ),
                ),
                Text(
                  StringsManager.deliveringTo,
                  style: TextStyle(
                    color: ColorManager.grayMedium,
                    fontSize: FontSize.s11,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      StringsManager.currentLocation,
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.grayMedium,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    DropdownButton<String>(
                      items: List.empty(),
                      onChanged: (value) {},
                      underline: SizedBox(),
                      iconEnabledColor: ColorManager.primary,
                      iconDisabledColor: ColorManager.primary,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                CustomSearchBar(),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p30, bottom: AppPadding.p58),
                  child: HorizentalWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.popularRestaurents,
                      style: TextStyle(
                          fontWeight: FontWeightManager.semiBold,
                          fontSize: FontSize.s20,
                          color: ColorManager.gray),
                    ),
                    CustomTextButton(),
                  ],
                ),
                VerticalWidget(),
                Padding(
                  padding:  EdgeInsets.only(top: AppPadding.p44,bottom: AppPadding.p33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringsManager.mostPopular,
                        style: TextStyle(
                            fontWeight: FontWeightManager.semiBold,
                            fontSize: FontSize.s20,
                            color: ColorManager.gray),
                      ),
                      CustomTextButton(),
                    ],
                  ),
                ),
                MostPopularWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.recentItems,
                      style: TextStyle(
                          fontWeight: FontWeightManager.semiBold,
                          fontSize: FontSize.s20,
                          color: ColorManager.gray),
                    ),
                    CustomTextButton(),
                  ],
                ),
                RecentItemsWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget buildVerticalItems() => Row(
//       children: [
//         Column(
//           children: [
//             Container(
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Image.asset(
//                 "assets/images/alireza-etemadi-9G_oJBKwi1c-unsplash.png",
//                 width: AppSize.s88,
//                 height: AppSize.s88,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             SizedBox(
//               height: AppPadding.p8,
//             ),
//             Text(
//               StringsManager.offers,
//               style: TextStyle(
//                 fontSize: FontSize.s14,
//                 fontWeight: FontWeightManager.bold,
//                 color: ColorManager.gray,
//               ),
//             )
//           ],
//         ),
//       ],
//     );
