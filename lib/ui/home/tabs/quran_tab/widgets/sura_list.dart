import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/app_constants.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/sura_item.dart';

class SuraList extends StatelessWidget {
  const SuraList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context, index) => SuraItem(AppConstants.suras[index]),
      separatorBuilder: (context, index) => Divider(
        color: ColorsManager.onPrimaryColor,
        indent: screenWidth * 0.12,
        endIndent: screenWidth * 0.12,
      ),
      itemCount: AppConstants.suras.length,
    );
  }
}
