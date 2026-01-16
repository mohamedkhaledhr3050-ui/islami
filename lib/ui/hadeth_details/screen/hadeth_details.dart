import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName= 'hadeth_details';
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(

    );
  }
}
