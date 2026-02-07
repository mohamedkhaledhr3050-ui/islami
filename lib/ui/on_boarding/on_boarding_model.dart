import 'package:islami_app/core/resources/assets_manager.dart';

class OnBoardingModel {
  String imagePath;
  String title;
  String? description;

  OnBoardingModel({
    this.imagePath = AssetsManager.onBoarding1,
    this.title = "Random Text",
    this.description,
  });
}
