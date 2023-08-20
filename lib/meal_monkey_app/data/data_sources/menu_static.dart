import 'package:meal_monkey/meal_monkey_app/core/strings_manager.dart';

import '../models/menu_model/menu_model.dart';

List<MenuModel> menuList = [
  MenuModel(
    title: StringsManager.food,
    description: StringsManager.itemsCount,
    image: "assets/images/food.png",
  ),
  MenuModel(
    title: StringsManager.beverages,
    description: StringsManager.itemsCount,
    image: "assets/images/beverages.png",
  ),
  MenuModel(
    title: StringsManager.desserts,
    description: StringsManager.itemsCount,
    image: "assets/images/desserts3.png",
  ),
  MenuModel(
    title: StringsManager.promotions,
    description: StringsManager.itemsCount,
    image: "assets/images/promotions.png",
  ),
];
