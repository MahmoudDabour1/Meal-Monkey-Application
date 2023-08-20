import '../../core/assets_manager.dart';
import '../../core/strings_manager.dart';
import '../models/on_boarding_model/on_boarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image:ImageAssets.onBoardingImage1,
    title: StringsManager.onBoardingTitle1,
    description: StringsManager.onBoardingDescription1,
  ),
  OnBoardingModel(
    image: ImageAssets.onBoardingImage2,
    title: StringsManager.onBoardingTitle2,
    description: StringsManager.onBoardingDescription2,
  ),
  OnBoardingModel(
    image: ImageAssets.onBoardingImage3,
    title: StringsManager.onBoardingTitle3,
    description: StringsManager.onBoardingDescription3,
  ),
];