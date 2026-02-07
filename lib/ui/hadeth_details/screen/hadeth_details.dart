import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName= 'hadeth_details';
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: (ColorsManager.secondaryColor),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManager.primaryColor),
        title: Text("Hadith ${hadethModel.number}"),
        titleTextStyle: TextStyle(
          color: ColorsManager.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.quranLeftCorner),
                      Text(
                        hadethModel.title,
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      Image.asset(AssetsManager.quranRightCorner),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadethModel.content,
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 2.5,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.quranMosque),
        ],
      ),
    );
  }
}
