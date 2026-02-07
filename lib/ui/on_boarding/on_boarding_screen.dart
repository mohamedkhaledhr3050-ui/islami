import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/ui/home/screen/home_screen.dart';
import 'package:islami_app/ui/on_boarding/dot_indicator.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoardingScreen";

  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      imagePath: AssetsManager.onBoarding1,
      title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
      imagePath: AssetsManager.onBoarding2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our\nCommunity",
    ),
    OnBoardingModel(
      imagePath: AssetsManager.onBoarding3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingModel(
      imagePath: AssetsManager.onBoarding4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most\n High",
    ),
    OnBoardingModel(
      imagePath: AssetsManager.onBoarding5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio\n through the application for free and easily",
    ),
  ];
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    _controller.addListener(() {
      currentIndex = _controller.page!.toInt();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0x99202020),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.islamiHeader, width: size.width * 0.6),
            SizedBox(height: size.height * 0.06),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onBoardingList[index].imagePath,
                        height: size.height * 0.40,
                      ),
                      SizedBox(height: size.height * 0.04),
                      Text(
                        onBoardingList[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: ColorsManager.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.05),
                      if (onBoardingList[index].description != null)
                        Text(
                          onBoardingList[index].description!,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: ColorsManager.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      const Spacer(),
                    ],
                  );
                },
                itemCount: onBoardingList.length,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex != 0
                          ? () {
                              _controller.animateToPage(
                                currentIndex - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInSine,
                              );
                            }
                          : null,
                      child: Text(
                        currentIndex != 0 ? "Back" : "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if(currentIndex == 4){
                          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                        }
                        else{
                          _controller.animateToPage(
                            currentIndex + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInSine,
                          );
                        }
                      },
                      child: Text(
                        currentIndex != 4? "Next" : "Finish",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(active: currentIndex == 0),
                    DotIndicator(active: currentIndex == 1),
                    DotIndicator(active: currentIndex == 2),
                    DotIndicator(active: currentIndex == 3),
                    DotIndicator(active: currentIndex == 4),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
