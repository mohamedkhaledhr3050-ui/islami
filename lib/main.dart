import 'package:flutter/material.dart';
import 'package:islami_app/ui/hadeth_details/screen/hadeth_details.dart';
import 'package:islami_app/ui/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        HadethDetails.routeName:(context)=> HadethDetails(),
      },
    );
  }
}

