import 'package:flutter/material.dart';
import 'package:islami_app/ui/hadeth_details/screen/hadeth_details.dart';
import 'package:islami_app/ui/home/screen/home_screen.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/ui/sura_details/screen/sura_details.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:OnBoardingScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        SuraDetails.routeName:(context) => SuraDetails(),
        HadethDetails.routeName:(context)=> HadethDetails(),
        OnBoardingScreen.routeName:(context)=>OnBoardingScreen()
      },
    );
  }
}

