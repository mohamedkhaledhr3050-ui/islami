import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0;
  int counter = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.islamiHeader,
              width: screenWidth * 0.8,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 16),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: ColorsManager.onPrimaryColor,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(AssetsManager.sebhaHeader),
            GestureDetector(
              onTap: onSebhaClicked,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedRotation(
                    turns: turns,
                    duration: Duration(microseconds: 200),
                    child: Image.asset(
                      AssetsManager.sebhaImg,
                      width: screenWidth * 0.8,
                    ),
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Text(
                        azkar[index],
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.onPrimaryColor,
                        ),
                      ),
                      Text(
                        "$counter",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.onPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSebhaClicked() {
    setState(() {
      counter++;
      turns += 5 / 33;

      if (counter == 33) {
        counter = 0;
        index = (index + 1) % azkar.length;
      }
    });
  }
}
